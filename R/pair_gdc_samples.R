#' Pair Tumor-Normal Samples from GDC Manifest
#'
#' Parses a GDC manifest file (or result from [parse_gdc_file_uuid()])
#' and creates paired tumor-normal sample information. This is useful
#' for generating matched pair lists for downstream genomic analyses.
#'
#' The function identifies tumor vs normal samples based on the TCGA
#' barcode: samples with position 14-15 less than `"10"` are classified
#' as tumor, others as normal. When both blood-derived and solid tissue
#' normals are available for a case, blood normal is preferred by default.
#'
#' @param x a path to a GDC manifest file, or a `data.frame` returned
#'   by [parse_gdc_file_uuid()].
#' @param prefer_blood_normal if `TRUE` (default), prefer blood-derived
#'   normal samples over solid tissue normals when both are available
#'   for the same case.
#'
#' @return a `data.frame` with columns:
#'   \item{pair_id}{unique pair identifier (generated from tumor sample ID)}
#'   \item{case_id}{TCGA case (patient) ID (first 12 characters of barcode)}
#'   \item{tumor_sample}{TCGA tumor sample barcode (first 15 characters),
#'     `NA` if no tumor for this case}
#'   \item{normal_sample}{TCGA normal sample barcode (first 15 characters),
#'     `NA` if no normal for this case}
#'   \item{file_id_tumor}{GDC file UUID for the tumor sample}
#'   \item{file_id_normal}{GDC file UUID for the normal sample}
#'   \item{tissue_type}{tissue type string from manifest (e.g. "Blood Derived Normal")}
#'
#' @export
#' @examples
#' \donttest{
#' # From a GDC manifest file
#' info <- pair_gdc_samples("gdc_manifest.txt")
#' head(info)
#'
#' # From a parse_gdc_file_uuid result
#' parsed <- parse_gdc_file_uuid("gdc_manifest.txt")
#' info <- pair_gdc_samples(parsed)
#' }
pair_gdc_samples <- function(x, prefer_blood_normal = TRUE) {

  # Accept both file path and data.frame
  if (is.character(x) && length(x) == 1L && file.exists(x)) {
    df <- parse_gdc_file_uuid(x)
  } else if (is.data.frame(x)) {
    df <- x
  } else {
    stop(
      "`x` must be a path to a GDC manifest file or a data.frame ",
      "returned by parse_gdc_file_uuid().",
      call. = FALSE
    )
  }

  # Standardize column names (parse_gdc_file_uuid returns variable field names)
  if (!all(c("sample", "type", "id") %in% names(df))) {
    nm <- names(df)
    sample_col <- grep("submitter_id|sample", nm, value = TRUE, ignore.case = TRUE)[1]
    type_col <- grep("sample_type|type", nm, value = TRUE, ignore.case = TRUE)[1]
    id_col <- grep("file_id|id", nm, value = TRUE, ignore.case = TRUE)[1]

    if (any(sapply(list(sample_col, type_col, id_col), is.na))) {
      stop(
        "Cannot identify required columns (sample, type, file_id) in the input.",
        call. = FALSE
      )
    }
    setnames(df, c(sample_col, type_col, id_col), c("sample", "type", "id"))
  }

  dt <- data.table::as.data.table(df)

  # Extract case and sample IDs from TCGA barcode
  dt[, case_id := substr(sample, 1, 12)]
  dt[, sample_id := substr(sample, 1, 15)]

  # Classify tumor vs normal by barcode position 14-15
  # TCGA: 01-09 = tumor, 10-19 = normal, 20-29 = control
  dt[, type2 := data.table::fifelse(
    as.integer(substr(sample_id, 14, 15)) < 10,
    "tumor", "normal"
  )]

  # Warn about non-TCGA samples
  if (!all(startsWith(dt$sample_id, "TCGA"))) {
    warning(
      "Some sample IDs do not start with 'TCGA'. ",
      "Tumor/normal classification may be incorrect for non-TCGA samples.",
      call. = FALSE
    )
  }

  case_list <- split(dt, dt$case_id)

  result <- lapply(case_list, function(case_dt) {
    build_case_pairs(case_dt, prefer_blood_normal)
  })

  result <- data.table::rbindlist(result, fill = TRUE)

  if (nrow(result) == 0L) {
    message("No valid tumor-normal pairs found.")
    return(invisible(data.frame()))
  }

  result <- result[!is.na(tumor_sample)]

  # Generate unique pair IDs
  data.table::setDF(result)
  result$pair_id <- make.unique(result$tumor_sample, sep = "_")

  # Order columns
  result <- result[, c(
    "pair_id", "case_id", "tumor_sample", "normal_sample",
    "file_id_tumor", "file_id_normal", "tissue_type"
  )]

  tibble::as_tibble(result)
}


# Build pairs for a single case
build_case_pairs <- function(case_dt, prefer_blood_normal) {
  tumors <- case_dt[type2 == "tumor"]
  normals <- case_dt[type2 == "normal"]

  # No tumor samples — skip this case
  if (nrow(tumors) == 0L) {
    return(data.table::data.table())
  }

  # Deduplicate by sample_id + id (same sample may appear multiple times
  # with different file UUIDs for different aliquots/plates)
  tumors <- unique(tumors, by = c("sample_id", "id"))
  normals <- unique(normals, by = c("sample_id", "id"))

  # Prefer blood normal over solid tissue normal
  if (prefer_blood_normal && nrow(normals) > 0L) {
    blood_idx <- grepl("Blood", normals$type, ignore.case = TRUE)
    if (any(blood_idx) && !all(blood_idx)) {
      normals <- normals[blood_idx]
    }
  }

  if (nrow(normals) == 0L) {
    # Tumor only — no normal available
    return(data.table::data.table(
      case_id = unique(case_dt$case_id),
      tumor_sample = unique(tumors$sample_id),
      normal_sample = NA_character_,
      file_id_tumor = tumors$id,
      file_id_normal = NA_character_,
      tissue_type = NA_character_
    ))
  }

  # Get unique samples
  unique_tumors <- unique(tumors$sample_id)
  unique_normals <- unique(normals$sample_id)

  # Build all tumor-normal combinations
  pairs <- data.table::CJ(
    tumor_sample = unique_tumors,
    normal_sample = unique_normals,
    sorted = FALSE
  )

  # Attach file IDs: pick the first file ID for each unique sample
  tumor_map <- unique(tumors[, list(sample_id, id)])
  normal_map <- unique(normals[, list(sample_id, id, type)])

  pairs[tumor_map, file_id_tumor := i.id, on = c("tumor_sample" = "sample_id")]
  pairs[normal_map, `:=`(
    file_id_normal = i.id,
    tissue_type = i.type
  ), on = c("normal_sample" = "sample_id")]

  pairs[, case_id := unique(case_dt$case_id)]
  pairs[]
}
