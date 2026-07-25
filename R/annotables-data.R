#' List Available Annotation Tables
#'
#' Lists all annotation tables that can be loaded via [load_data()] from
#' the Zenodo repository (fixed Ensembl version). For the latest Ensembl
#' annotations, use [build_annotables()] to query BioMart directly.
#'
#' These tables have basic annotation information from **Ensembl Genes** for:
#' -   Human build 38 (`grch38`)
#' -   Human build 37 (`grch37`)
#' -   Mouse (`grcm38`)
#' -   Rat (`rnor6`)
#' -   Chicken (`galgal5`)
#' -   Worm (`wbcel235`)
#' -   Fly (`bdgp6`)
#' -   Macaque (`mmul801`)
#' Where each table contains:
#' -   `ensgene`: Ensembl gene ID
#' -   `entrez`: Entrez gene ID
#' -   `symbol`: Gene symbol
#' -   `chr`: Chromosome
#' -   `start`: Start
#' -   `end`: End
#' -   `strand`: Strand
#' -   `biotype`: Protein coding, pseudogene, mitochondrial tRNA, etc.
#' -   `description`: Full gene name/description
#' Additionally, there are `tx2gene` tables that link Ensembl gene IDs to
#' Ensembl transcript IDs.
#'
#' Use [build_annotables()] to fetch the latest annotations from Ensembl
#' BioMart, which also supports additional organisms (dog, zebrafish, pig).
#'
#' @return a character vector of available table names.
#' @export
#' @references <https://github.com/stephenturner/annotables>
#' @seealso [build_annotables()] for live Ensembl BioMart queries.
#'
#' @examples
#' \donttest{
#' ls_annotables()
#' load_data(ls_annotables()[1])
#' }
ls_annotables <- function() {
  ver <- load_data("ensembl_version")
  if (!is.null(ver)) {
    message("Version: ", ver)
  } else {
    message("Version: unknown (network required to fetch version info)")
  }
  c(
    "bdgp6", "bdgp6_tx2gene",
    "galgal5", "galgal5_tx2gene",
    "grch37", "grch37_tx2gene",
    "grch38", "grch38_tx2gene",
    "grcm38", "grcm38_tx2gene",
    "mmul801", "mmul801_tx2gene",
    "rnor6", "rnor6_tx2gene",
    "wbcel235", "wbcel235_tx2gene"
  )
}
