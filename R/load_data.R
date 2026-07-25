.data_path <- function() {
  getOption("IDConverter.datapath", tempdir())
}

# Copy from sigminer
query_remote_data <- function(x) {
  x_url <- paste0("https://zenodo.org/records/10360995/files/", x)
  # dir_dest <- system.file("extdata", package = "IDConverter")
  dir_dest <- getOption("IDConverter.datapath", .data_path())
  if (!dir.exists(dir_dest)) dir.create(dir_dest, recursive = TRUE)
  x_dest <- file.path(dir_dest, x)
  message("Downloading ", x_url, " to ", x_dest)
  tryCatch(
    {
      suppressWarnings(
        download.file(
          url = x_url,
          destfile = x_dest
        )
      )
      TRUE
    },
    error = function(e) {
      message("Failed downloading the data.")
      message("Removing downloaded file")
      if (file.exists(x_dest)) file.remove(x_dest)
      FALSE
    }
  )
}

#' Load Data from Local or Remote Zenodo Repository
#'
#' Data are stored in remote [Zenodo repo](https://zenodo.org/records/10360995).
#' This function will help download required data and load it into R.
#' For datasets bundled with the package (`tcga`, `icgc`, `pcawg_full`,
#' `pcawg_simple`), local data is used directly without network access.
#'
#' @param x a dataset name.
#'
#' @return typically a `data.frame`, depends on `x`.
#' @importFrom utils download.file
#' @importFrom utils data
#' @export
#' @examples
#' \donttest{
#' load_data("pcawg_full")
#' load_data("pcawg_simple")
#' load_data("tcga")
#' load_data("icgc")
#' }
load_data <- function(x) {
  # First, try to load from package bundled data (no network needed)
  bundled_data <- tryCatch(
    {
      e <- new.env(parent = emptyenv())
      utils::data(list = x, package = "IDConverter", envir = e)
      if (length(ls(e)) > 0) {
        return(e[[ls(e)[1]]])
      }
      NULL
    },
    error = function(e) NULL,
    warning = function(w) NULL
  )

  if (!is.null(bundled_data)) {
    return(bundled_data)
  }

  # Fall back to file-based loading for non-bundled datasets
  load_file <- file.path(
    getOption("IDConverter.datapath", .data_path()),
    paste0(x, ".rda")
  )
  ok <- TRUE
  if (!file.exists(load_file)) ok <- query_remote_data(basename(load_file))
  if (!ok) {
    return(invisible(NULL))
  }
  tryCatch(
    {
      load(load_file)
      get(setdiff(ls(), c("load_file", "ok", "x", "bundled_data", "e")))
    },
    error = function(e) {
      message("Failed loading the data.")
      NULL
    }
  )
}
