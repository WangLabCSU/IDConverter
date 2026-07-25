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
# Note: mirrors are tried sequentially; reorder based on current availability
ENSEMBL_MIRRORS <- c(
  "https://www.ensembl.org",
  "https://asia.ensembl.org",
  "https://useast.ensembl.org",
  "https://uswest.ensembl.org"
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
#' @param include_synonyms if `TRUE`, also fetch `external_synonym` (gene
#'   name aliases) from BioMart and include a `synonym` column in the
#'   output tables. Default `FALSE` for faster queries.
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
#' - \url{https://www.ensembl.org/info/data/biomart.html}
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
                              include_synonyms = FALSE,
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

    # Extend attributes for synonym query
    query_attrs <- recipe$attributes
    if (include_synonyms) {
      query_attrs$synonym <- "external_synonym"
    }

    # Check cache (keyed by synonym setting)
    cache_suffix <- if (include_synonyms) "_syn" else ""
    if (!is.null(cache_dir)) {
      cache_file <- file.path(cache_dir, paste0(rname, cache_suffix, ".rda"))
      if (file.exists(cache_file)) {
        if (verbose) message("  Loading from cache: ", cache_file)
        e <- new.env(parent = emptyenv())
        load(cache_file, envir = e)
        result[[rname]] <- e[[ls(e)[1]]]
        next
      }
    }

    # Query BioMart
    query_recipe <- recipe
    query_recipe$attributes <- query_attrs
    tbl <- try_query_biomart(query_recipe, mirrors, verbose)
    if (is.null(tbl)) {
      failures <- c(failures, rname)
      warning("Failed to build recipe '", rname, "': all mirrors failed", call. = FALSE)
      next
    }

    tbl <- tidy_annotable(tbl, query_recipe)
    result[[rname]] <- tbl

    # Cache result
    if (!is.null(cache_dir)) {
      if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
      cache_file <- file.path(cache_dir, paste0(rname, cache_suffix, ".rda"))
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


# ============================================================================
# Gene symbol alias resolution
# ============================================================================

#' Resolve Gene Symbol Aliases
#'
#' Maps gene symbols through known aliases (synonyms) to their current
#' official symbols and Ensembl gene IDs. This helps when working with
#' outdated or alternative gene names (e.g., "MLL" -> "KMT2A").
#'
#' @param symbols a character vector of gene symbols to resolve.
#' @param annotable a `data.frame` from [build_annotables()] with
#'   `include_synonyms = TRUE`. Must contain `symbol` and `synonym` columns.
#' @param multiple if `TRUE`, return a `data.frame` with all matches
#'   (including cases where one alias maps to multiple genes).
#'
#' @return a `data.frame` (tibble) with columns:
#'   \item{query}{the input gene symbols}
#'   \item{symbol}{resolved official gene symbol (\code{NA} if unmatched)}
#'   \item{ensgene}{resolved Ensembl gene ID (\code{NA} if unmatched)}
#'   When `multiple = TRUE`, each row is a single query->match pair,
#'   so one query may appear in multiple rows.
#'
#' @export
#' @examples
#' \donttest{
#' # Build annotables with synonym support
#' ann <- build_annotables("grch38", include_synonyms = TRUE, tx2gene = FALSE)
#'
#' # Resolve aliases
#' resolve_gene_aliases(c("TP53", "MLL", "NOTAGENE"), ann[[1]])
#'
#' # Multiple match mode
#' resolve_gene_aliases(c("TP53", "MLL"), ann[[1]], multiple = TRUE)
#' }
resolve_gene_aliases <- function(symbols, annotable, multiple = FALSE) {
  stopifnot(is.data.frame(annotable))
  if (!all(c("symbol", "ensgene") %in% colnames(annotable))) {
    stop("`annotable` must contain 'symbol' and 'ensgene' columns.", call. = FALSE)
  }
  if (!"synonym" %in% colnames(annotable)) {
    stop(
      "`annotable` must contain a 'synonym' column. ",
      "Use build_annotables(include_synonyms = TRUE) to include synonyms.",
      call. = FALSE
    )
  }

  dt <- data.table::as.data.table(annotable)
  dt <- unique(dt[, list(symbol, ensgene, synonym)])

  # Build alias lookup: each alias -> list of (symbol, ensgene) pairs
  alias_map <- data.table::data.table(
    alias = character(), symbol = character(), ensgene = character()
  )

  for (i in seq_len(nrow(dt))) {
    syns <- strsplit(dt$synonym[i], ";")[[1]]
    syns <- trimws(syns)
    syns <- syns[nzchar(syns)]
    if (length(syns) > 0) {
      alias_map <- data.table::rbindlist(list(
        alias_map,
        data.table::data.table(
          alias = syns,
          symbol = dt$symbol[i],
          ensgene = dt$ensgene[i]
        )
      ), fill = TRUE)
    }
  }

  # Remove duplicate alias->symbol mappings
  alias_map <- unique(alias_map)

  # Resolve each input symbol
  primary <- unique(dt[, list(symbol, ensgene)])

  result <- data.table::data.table(query = symbols)
  result[, c("symbol", "ensgene") := list(NA_character_, NA_character_)]

  for (i in seq_along(symbols)) {
    s <- symbols[i]

    # Try primary symbol match
    match_row <- primary[symbol == s]
    if (nrow(match_row) > 0) {
      if (!multiple) {
        data.table::set(result, i, "symbol", match_row$symbol[1])
        data.table::set(result, i, "ensgene", match_row$ensgene[1])
      }
      next
    }

    # Try alias match
    alias_match <- alias_map[alias == s]
    if (nrow(alias_match) > 0) {
      data.table::set(result, i, "symbol", alias_match$symbol[1])
      data.table::set(result, i, "ensgene", alias_match$ensgene[1])
    }
  }

  # For multiple mode, return all matches (primary + alias)
  if (multiple) {
    all_matches <- data.table::rbindlist(lapply(symbols, function(s) {
      primary_match <- primary[symbol == s]
      alias_match <- alias_map[alias == s]
      r <- unique(data.table::rbindlist(list(
        primary_match,
        alias_match[, list(symbol, ensgene)]
      ), fill = TRUE))
      if (nrow(r) > 0) {
        r[, query := s]
        data.table::setcolorder(r, "query")
      }
      r
    }), fill = TRUE)
    return(tibble::as_tibble(all_matches))
  }

  tibble::tibble(query = symbols, symbol = result$symbol, ensgene = result$ensgene)
}


`%||%` <- function(x, y) if (is.null(x)) y else x
