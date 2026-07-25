# ============================================================================
# Human-Mouse ortholog gene ID conversion via Ensembl BioMart
# ============================================================================

ORTHOLOG_CONFIG <- list(
  human = list(
    biomart  = "ENSEMBL_MART_ENSEMBL",
    dataset  = "hsapiens_gene_ensembl",
    id_col   = "ensembl_gene_id",
    name_col = "external_gene_name",
    homolog_prefix = "mmusculus_homolog"
  ),
  mouse = list(
    biomart  = "ENSEMBL_MART_ENSEMBL",
    dataset  = "mmusculus_gene_ensembl",
    id_col   = "ensembl_gene_id",
    name_col = "external_gene_name",
    homolog_prefix = "hsapiens_homolog"
  )
)

#' Convert Gene IDs Between Human and Mouse via Orthology
#'
#' Maps gene symbols or Ensembl IDs between human and mouse using
#' Ensembl BioMart orthology data. This resolves homologous gene
#' relationships (e.g., human TP53 <-> mouse Trp53).
#'
#' @param IDs a character vector of gene symbols or Ensembl IDs.
#' @param from_species source species: `"human"` (default) or `"mouse"`.
#' @param to_species target species: `"mouse"` (default) or `"human"`.
#'   Must differ from `from_species`.
#' @param from_type type of input IDs: `"symbol"` (default) or `"ensembl"`.
#' @param to_type type of output IDs: `"symbol"` (default), `"ensembl"`,
#'   or `"both"` to return both columns.
#' @param multiple if `TRUE`, return a `data.frame` with all ortholog
#'   matches (e.g., one-to-many relationships).
#' @param high_confidence_only if `TRUE` (default), restrict to orthologs
#'   with high confidence (confidence == 1) in Ensembl.
#' @param mirrors character vector of Ensembl mirror URLs.
#' @param cache_dir directory to cache query results. Set `NULL` to skip.
#' @param verbose if `TRUE`, print progress messages.
#'
#' @return If `multiple = FALSE`, a character vector of converted IDs
#'   (NA for unmatched). If `multiple = TRUE` or `to_type = "both"`,
#'   a `data.frame`.
#'
#' @details
#' **Requirements:** This function requires the Bioconductor package
#' \pkg{biomaRt}. Install it with:\preformatted{
#' if (!requireNamespace("BiocManager", quietly = TRUE))
#'     install.packages("BiocManager")
#' BiocManager::install("biomaRt")
#' }
#'
#' Orthology data is queried live from Ensembl and cached locally.
#'
#' @export
#' @examples
#' \donttest{
#' # Human symbol -> mouse symbol
#' convert_hm_orthologs(c("TP53", "KRAS", "EGFR"))
#'
#' # Mouse symbol -> human symbol
#' convert_hm_orthologs(c("Trp53", "Kras"), from_species = "mouse", to_species = "human")
#'
#' # Human Ensembl -> mouse Ensembl
#' convert_hm_orthologs("ENSG00000141510", from_type = "ensembl", to_type = "ensembl")
#' }
convert_hm_orthologs <- function(IDs,
                                  from_species = c("human", "mouse"),
                                  to_species   = c("mouse", "human"),
                                  from_type    = c("symbol", "ensembl"),
                                  to_type      = c("symbol", "ensembl", "both"),
                                  multiple     = FALSE,
                                  high_confidence_only = TRUE,
                                  mirrors      = ENSEMBL_MIRRORS,
                                  cache_dir    = getOption("IDConverter.datapath", tempdir()),
                                  verbose      = TRUE) {

  from_species <- match.arg(from_species)
  to_species   <- match.arg(to_species)
  from_type    <- match.arg(from_type)
  to_type      <- match.arg(to_type)

  if (from_species == to_species) {
    stop("`from_species` and `to_species` must differ.", call. = FALSE)
  }

  if (!requireNamespace("biomaRt", quietly = TRUE)) {
    stop(
      "Package 'biomaRt' is required to query Ensembl BioMart.\n",
      "Install it with:\n",
      "  if (!requireNamespace('BiocManager', quietly = TRUE))\n",
      "      install.packages('BiocManager')\n",
      "  BiocManager::install('biomaRt')",
      call. = FALSE
    )
  }

  cfg <- ORTHOLOG_CONFIG[[from_species]]

  # Attributes to query
  attrs <- c(cfg$id_col, cfg$name_col)

  # Homolog attributes
  prefix <- cfg$homolog_prefix
  homolog_ensembl_attr <- paste0(prefix, "_ensembl_gene")
  homolog_name_attr    <- paste0(prefix, "_associated_gene_name")
  homolog_type_attr    <- paste0(prefix, "_orthology_type")
  homolog_conf_attr    <- paste0(prefix, "_orthology_confidence")

  attrs <- c(attrs, homolog_ensembl_attr, homolog_name_attr)
  if (high_confidence_only) {
    attrs <- c(attrs, homolog_type_attr, homolog_conf_attr)
  }

  # Build cache key
  cache_key <- paste0(
    "ortholog_", from_species, "_to_", to_species,
    "_", from_type, "_", to_type,
    if (high_confidence_only) "_hc" else "_all",
    ".rda"
  )

  # Check cache for a pre-built full table
  if (!is.null(cache_dir)) {
    cache_file <- file.path(cache_dir, cache_key)
    if (file.exists(cache_file)) {
      if (verbose) message("Loading cached ortholog table: ", cache_file)
      e <- new.env(parent = emptyenv())
      load(cache_file, envir = e)
      ortho_dt <- e[[ls(e)[1]]]
      return(resolve_orthologs(ortho_dt, IDs, from_type, to_type, multiple, from_species))
    }
  }

  # Query BioMart
  if (verbose) message("Querying Ensembl BioMart for ", from_species, "->", to_species, " orthologs...")

  query_filter <- if (from_type == "symbol") cfg$name_col else cfg$id_col

  raw <- NULL
  for (mirror in mirrors) {
    if (verbose) message("  Trying mirror: ", mirror)
    raw <- tryCatch(
      {
        mart <- biomaRt::useMart(
          biomart = cfg$biomart,
          dataset = cfg$dataset,
          host    = mirror
        )
        biomaRt::getBM(
          attributes = attrs,
          filters    = query_filter,
          values     = IDs,
          mart       = mart
        )
      },
      error = function(e) {
        if (verbose) message("    Failed: ", conditionMessage(e))
        NULL
      }
    )
    if (!is.null(raw) && nrow(raw) > 0) break
  }

  if (is.null(raw) || nrow(raw) == 0) {
    message("All mirrors failed or no orthologs found.")
    if (multiple || to_type == "both") {
      empty <- data.frame(
        query       = IDs,
        from_symbol = if (from_type == "symbol") IDs else NA_character_,
        from_ensembl = if (from_type == "ensembl") IDs else NA_character_,
        to_symbol   = NA_character_,
        to_ensembl  = NA_character_,
        stringsAsFactors = FALSE
      )
      return(empty)
    }
    return(stats::setNames(rep(NA_character_, length(IDs)), IDs))
  }

  if (verbose) message("    OK: ", nrow(raw), " rows")

  ortho_dt <- data.table::as.data.table(raw)
  data.table::setnames(ortho_dt,
    old = c(cfg$id_col, cfg$name_col, homolog_ensembl_attr, homolog_name_attr),
    new = c("from_ensembl", "from_symbol", "to_ensembl", "to_symbol")
  )

  # Filter for high confidence
  if (high_confidence_only && homolog_conf_attr %in% names(ortho_dt)) {
    data.table::setnames(ortho_dt, c(homolog_conf_attr, homolog_type_attr),
                         c("confidence", "orthology_type"))
    ortho_dt <- ortho_dt[confidence == 1]
    # For one-to-many, keep all; for many-to-one, keep first
    if (!multiple) {
      ortho_dt <- ortho_dt[!duplicated(ortho_dt$from_ensembl)]
    }
  }

  # Cache the full result
  if (!is.null(cache_dir) && nrow(ortho_dt) > 0) {
    if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
    cache_file <- file.path(cache_dir, cache_key)
    ortholog_table <- ortho_dt
    save(ortholog_table, file = cache_file, compress = "xz")
    if (verbose) message("  Cached to: ", cache_file)
  }

  resolve_orthologs(ortho_dt, IDs, from_type, to_type, multiple, from_species)
}


resolve_orthologs <- function(ortho_dt, IDs, from_type, to_type, multiple, from_species) {
  # Build lookup from the query column
  lookup_col <- if (from_type == "symbol") "from_symbol" else "from_ensembl"

  if (multiple || to_type == "both") {
    # Full join: all input IDs x all matches
    result <- data.table::data.table(query = IDs)

    matched <- ortho_dt[ortho_dt[[lookup_col]] %in% IDs]
    result <- merge(result, matched,
      by.x = "query", by.y = lookup_col,
      all.x = TRUE, sort = FALSE
    )

    if (nrow(result) == 0) {
      result <- data.table::data.table(
        query       = IDs,
        from_symbol = NA_character_,
        from_ensembl = NA_character_,
        to_symbol   = NA_character_,
        to_ensembl  = NA_character_
      )
    }

    if (to_type != "both") {
      keep <- if (to_type == "symbol") "to_symbol" else "to_ensembl"
      result <- result[, c("query", keep), with = FALSE]
    }

    return(tibble::as_tibble(result))
  }

  # Simple mapping
  mp <- stats::setNames(ortho_dt[["to_symbol"]], ortho_dt[[lookup_col]])
  if (to_type == "ensembl") {
    mp <- stats::setNames(ortho_dt[["to_ensembl"]], ortho_dt[[lookup_col]])
  }

  # Handle duplicates: keep first
  mp <- mp[!duplicated(names(mp))]

  result <- unname(mp[IDs])
  names(result) <- IDs
  result
}
