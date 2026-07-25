# Convert TCGA Identifiers

Run `data("tcga")` to see detail database for conversion.

## Usage

``` r
convert_tcga(x, from = "sample_id", to = "submitter_id", multiple = FALSE)
```

## Arguments

- x:

  A character vector to convert.

- from:

  Which identifier type to be converted. One of case_id, aliquot_ids,
  submitter_aliquot_ids, submitter_id, sample_id.

- to:

  Identifier type convert to. Same as parameter `from`.

- multiple:

  if `TRUE`, return a `data.table` instead of a string vector, so
  multiple identifier mappings can be kept.

## Value

A character vector.

## Examples

``` r
# \donttest{
x <- convert_tcga("TCGA-02-0001-10")
x
#> [1] "TCGA-02-0001"
# }
if (FALSE) { # \dontrun{
convert_tcga("TCGA-02-0001-10A-01W-0188-10")
} # }
```
