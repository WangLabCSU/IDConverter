#' @keywords internal
#' @import data.table
#' @importFrom tibble tibble
"_PACKAGE"

# Suppress R CMD check NOTE for data.table NSE variables
utils::globalVariables(c(
  ".", "alias", "case_id", "confidence", "ensgene", "file_id_tumor", "file_id_normal",
  "i.id", "i.type", "id", "normal_sample", "query",
  "sample_id", "symbol", "synonym", "tissue_type", "tumor_sample",
  "type", "type2"
))

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL
