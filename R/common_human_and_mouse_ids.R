#' Convert Gene IDs between Ensembl and Hugo Symbol System
#'
#' Supports human (hg38, hg19, T2T), mouse (mm10, mm9), and
#' worm (ce11, C. elegans) genomes.
#'
#' @note
#' This function matches against **primary** gene symbols only. For
#' resolving outdated or alternative gene names (aliases like "MLL" → "KMT2A"),
#' use [build_annotables()] with `include_synonyms = TRUE` followed by
#' [resolve_gene_aliases()].
#'
#' @param IDs a character vector to convert.
#' @param type type of input `IDs`, could be 'ensembl' or 'symbol'.
#' @param genome_build reference genome build.
#' @param multiple 	if `TRUE`, return a `data.table` instead of a string vector,
#' so multiple identifier mappings can be kept.
#'
#' @return a vector or a `data.table`.
#' @seealso [resolve_gene_aliases()] for resolving gene symbol aliases.
#' @export
#'
#' @examples
#' \donttest{
#' convert_hm_genes("ENSG00000243485")
#' convert_hm_genes("ENSG00000243485", multiple = TRUE)
#' convert_hm_genes(c("TP53", "KRAS", "EGFR", "MYC"), type = "symbol")
#' }
convert_hm_genes <- function(IDs, type = c("ensembl", "symbol"),
                             genome_build = c("hg38", "hg19", "mm10", "mm9",
                                              "ce11", "T2T"),
                             multiple = FALSE) {
  type <- match.arg(type)
  genome_build <- match.arg(genome_build)
  ref_data <- get_common_ref_data(genome_build)
  if (is.null(ref_data)) {
    message(
      "Failed obtaining the reference data. ",
      "This function requires network access to download gene annotation data ",
      "from Zenodo on first use. Please ensure network connectivity, ",
      "or pre-download the data files."
    )
    return(invisible(NULL))
  }

  if (genome_build %in% c("hg38", "hg19", "T2T")) {
    ref_data$gene_id <- substr(ref_data$gene_id, 1, 15)
  } else {
    ref_data$gene_id <- substr(ref_data$gene_id, 1, 18)
  }

  if (type == "symbol") {
    from <- "gene_name"
    to <- "gene_id"
  } else {
    from <- "gene_id"
    to <- "gene_name"
  }

  convert_custom(IDs, from, to, ref_data, multiple)
}


get_common_ref_data <- function(genome_build = c("hg38", "hg19", "mm10", "mm9",
                                                  "ce11", "T2T")) {
  genome_build <- match.arg(genome_build)
  gene_file <- switch(genome_build,
    mm9 = file.path(
      getOption("IDConverter.datapath", .data_path()),
      "mouse_mm9_gene_info.rds"
    ),
    mm10 = file.path(
      getOption("IDConverter.datapath", .data_path()),
      "mouse_mm10_gene_info.rds"
    ),
    ce11 = file.path(
      getOption("IDConverter.datapath", .data_path()),
      "ce11_gene_info.rds"
    ),
    T2T = file.path(
      getOption("IDConverter.datapath", .data_path()),
      "human_T2T_gene_info.rds"
    ),
    file.path(
      getOption("IDConverter.datapath", .data_path()),
      paste0("human_", genome_build, "_gene_info.rds")
    )
  )
  ok <- TRUE
  if (!file.exists(gene_file)) ok <- query_remote_data(basename(gene_file))
  if (!ok) {
    return(invisible(NULL))
  }
  gene_dt <- readRDS(gene_file)
  gene_dt
}
