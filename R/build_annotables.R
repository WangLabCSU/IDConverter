# ============================================================================
# Build annotables directly from Ensembl BioMart
# Recipes derived from https://github.com/stephenturner/annotables
# ============================================================================

ANNOTABLES_RECIPES <- list(
  grch38 = list(
    name = "Human", species = "Homo sapiens",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "hsapiens_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  grch37 = list(
    name = "Human", species = "Homo sapiens",
    host = "https://grch37.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "hsapiens_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  grcm38 = list(
    name = "Mouse", species = "Mus musculus",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "mmusculus_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  rnor6 = list(
    name = "Rat", species = "Rattus norvegicus",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "rnorvegicus_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  bdgp6 = list(
    name = "Fruitfly", species = "Drosophila melanogaster",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "dmelanogaster_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  galgal5 = list(
    name = "Chicken", species = "Gallus gallus",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "ggallus_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  mmul801 = list(
    name = "Macaque", species = "Macaca mulatta",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "mmulatta_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  wbcel235 = list(
    name = "Roundworm", species = "Caenorhabditis elegans",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "celegans_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  cfamiliaris = list(
    name = "Dog", species = "Canis lupus familiaris",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "clfamiliaris_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  drerio = list(
    name = "Zebrafish", species = "Danio rerio",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "drerio_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  ),
  sscrofa = list(
    name = "Pig", species = "Sus scrofa",
    host = "https://useast.ensembl.org",
    biomart = "ENSEMBL_MART_ENSEMBL",
    dataset = "sscrofa_gene_ensembl",
    attributes = list(
      ensgene = "ensembl_gene_id", entrez = "entrezgene_id",
      symbol = "external_gene_name", chr = "chromosome_name",
      start = "start_position", end = "end_position",
      strand = "strand", biotype = "gene_biotype",
      description = "description"
    )
  )
)

# Ensembl mirrors to try in order of preference
ENSEMBL_MIRRORS <- c(
  "https://useast.ensembl.org",
  "https://uswest.ensembl.org",
  "https://www.ensembl.org",
  "https://asia.ensembl.org"
)

#' Build Gene Annotation Tables from Ensembl BioMart
#'
#' Queries Ensembl BioMart directly to build up-to-date gene annotation
#' tables ("annotables") using recipes derived from the
#' [annotables](https://github.com/stephenturner/annotables) package.
#' This provides the latest annotations from Ensembl when internet is
#' available, as an alternative to the fixed-version tables stored on Zenodo.
#'
#' @param recipes character vector of recipe names to build, or `NULL`
#'   to build all available recipes. Use `ls_annotables()` to see which
#'   organisms are available (matching the "gene" + "tx2gene" table names).
#'   Recipe names include `"grch38"`, `"grch37"`, `"grcm38"`, `"bdgp6"`,
#'   `"galgal5"`, `"rnor6"`, `"mmul801"`, `"wbcel235"`, `"cfamiliaris"`,
#'   `"drerio"`, `"sscrofa"`.
#' @param tx2gene if `TRUE` (default), also build transcript-to-gene
#'   mapping tables (appended with `_tx2gene` suffix).
#' @param mirrors character vector of Ensembl mirror URLs to try in order.
#'   The function automatically falls back to the next mirror on failure.
#' @param cache_dir directory path to cache downloaded tables as `.rda`
#'   files. Set to `NULL` to skip caching. Default uses the package's
#'   data path (customizable via `options(IDConverter.datapath = ...)`).
#' @param verbose if `TRUE`, print progress messages.
#'
#' @return a named list of `data.frame` objects (tibbles). The list names
#'   correspond to recipe names (and `_tx2gene` variants if `tx2gene = TRUE`).
#'   Returns `invisible(NULL)` on total failure.
#'
#' @details
#' **Requirements:** This function requires the Bioconductor package
#' \pkg{biomaRt}. Install it with:\preformatted{
#' if (!requireNamespace("BiocManager", quietly = TRUE))
#'     install.packages("BiocManager")
#' BiocManager::install("biomaRt")
#' }
#'
#' **Mirror fallback:** Ensembl mirrors can be unreliable. The function
#' tries each mirror in `mirrors` for each recipe until one succeeds.
#' If all mirrors fail for a recipe, that recipe is skipped with a warning.
#'
#' **Caching:** When `cache_dir` is set, successfully downloaded tables
#' are saved as `.rda` files. Subsequent calls with the same `cache_dir`
#' will load from cache instead of re-querying, unless `cache_dir = NULL`.
#'
#' @seealso [load_data()] for loading fixed-version tables from Zenodo,
#'   [ls_annotables()] for listing available tables.
#' @references
#' - \url{https://github.com/stephenturner/annotables}
#' - \url{https://useast.ensembl.org/info/data/biomart.html}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Build a single annotable table
#' grch38 <- build_annotables("grch38", tx2gene = FALSE)
#' head(grch38[[1]])
#'
#' # Build all available tables (requires internet + biomaRt)
#' all_tables <- build_annotables()
#' names(all_tables)
#' }
build_annotables <- function(recipes = NULL,
                              tx2gene = TRUE,
                              mirrors = ENSEMBL_MIRRORS,
                              cache_dir = getOption("IDConverter.datapath", tempdir()),
                              verbose = TRUE) {

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

  recipe_names <- recipes %||% names(ANNOTABLES_RECIPES)
  invalid <- setdiff(recipe_names, names(ANNOTABLES_RECIPES))
  if (length(invalid) > 0) {
    stop(
      "Invalid recipe(s): ", paste(invalid, collapse = ", "), "\n",
      "Available recipes: ", paste(names(ANNOTABLES_RECIPES), collapse = ", "),
      call. = FALSE
    )
  }

  result <- list()
  failures <- character()

  for (rname in recipe_names) {
    if (verbose) message("--- Building: ", rname, " ---")

    recipe <- ANNOTABLES_RECIPES[[rname]]

    # Check cache
    if (!is.null(cache_dir)) {
      cache_file <- file.path(cache_dir, paste0(rname, ".rda"))
      if (file.exists(cache_file)) {
        if (verbose) message("  Loading from cache: ", cache_file)
        e <- new.env(parent = emptyenv())
        load(cache_file, envir = e)
        result[[rname]] <- e[[ls(e)[1]]]
        next
      }
    }

    # Query BioMart
    tbl <- try_query_biomart(recipe, mirrors, verbose)
    if (is.null(tbl)) {
      failures <- c(failures, rname)
      warning("Failed to build recipe '", rname, "': all mirrors failed", call. = FALSE)
      next
    }

    tbl <- tidy_annotable(tbl, recipe)
    result[[rname]] <- tbl

    # Cache result
    if (!is.null(cache_dir)) {
      if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
      cache_file <- file.path(cache_dir, paste0(rname, ".rda"))
      assign(rname, tbl)
      save(list = rname, file = cache_file, compress = "xz")
      if (verbose) message("  Cached to: ", cache_file)
    }
  }

  # Build tx2gene tables
  if (tx2gene) {
    for (rname in recipe_names) {
      if (rname %in% failures) next

      txname <- paste0(rname, "_tx2gene")
      if (verbose) message("--- Building: ", txname, " ---")

      if (!is.null(cache_dir)) {
        cache_file <- file.path(cache_dir, paste0(txname, ".rda"))
        if (file.exists(cache_file)) {
          if (verbose) message("  Loading from cache: ", cache_file)
          e <- new.env(parent = emptyenv())
          load(cache_file, envir = e)
          result[[txname]] <- e[[ls(e)[1]]]
          next
        }
      }

      recipe <- ANNOTABLES_RECIPES[[rname]]
      recipe$attributes <- list(
        enstxp = "ensembl_transcript_id",
        ensgene = "ensembl_gene_id"
      )

      tbl <- try_query_biomart(recipe, mirrors, verbose)
      if (is.null(tbl)) {
        warning("Failed to build tx2gene for '", rname, "': all mirrors failed", call. = FALSE)
        next
      }

      tbl <- tidy_annotable(tbl, recipe, tx = TRUE)
      result[[txname]] <- tbl

      if (!is.null(cache_dir)) {
        cache_file <- file.path(cache_dir, paste0(txname, ".rda"))
        assign(txname, tbl)
        save(list = txname, file = cache_file, compress = "xz")
        if (verbose) message("  Cached to: ", cache_file)
      }
    }
  }

  if (length(failures) > 0) {
    warning(
      "Failed to build ", length(failures), " recipe(s): ",
      paste(failures, collapse = ", "),
      call. = FALSE
    )
  }

  if (length(result) == 0) {
    message("No tables were built successfully.")
    return(invisible(NULL))
  }

  if (verbose) {
    message(
      "\nSuccessfully built ", length(result), " table(s). ",
      "Use names() to see available tables."
    )
  }

  result
}


# Try querying BioMart across multiple mirrors
try_query_biomart <- function(recipe, mirrors, verbose = TRUE) {
  for (mirror in mirrors) {
    if (verbose) message("  Trying mirror: ", mirror)
    result <- tryCatch(
      {
        mart <- biomaRt::useMart(
          biomart = recipe$biomart,
          dataset = recipe$dataset,
          host = mirror
        )
        attrs <- unlist(recipe$attributes, use.names = FALSE)
        biomaRt::getBM(attributes = attrs, mart = mart)
      },
      error = function(e) {
        if (verbose) message("    Failed: ", conditionMessage(e))
        NULL
      }
    )
    if (!is.null(result) && nrow(result) > 0) {
      if (verbose) message("    OK: ", nrow(result), " rows")
      return(result)
    }
  }
  NULL
}


# Tidy a BioMart query result into a clean annotable table
tidy_annotable <- function(df, recipe, tx = FALSE) {
  df <- tibble::as_tibble(df)
  df <- unique(df)

  # Rename columns using recipe attributes
  attr_map <- stats::setNames(names(recipe$attributes), unlist(recipe$attributes))
  common_cols <- intersect(names(attr_map), colnames(df))
  if (length(common_cols) > 0) {
    colnames(df)[match(common_cols, colnames(df))] <- attr_map[common_cols]
  }

  if (!tx && "description" %in% colnames(df)) {
    df$description <- sub(" \\[Source:.*\\]$", "", df$description)
  }

  if ("ensgene" %in% colnames(df)) {
    df <- df[order(df$ensgene), ]
  }

  df
}


`%||%` <- function(x, y) if (is.null(x)) y else x
