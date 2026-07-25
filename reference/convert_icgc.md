# Convert ICGC Identifiers

Run `data("icgc")` to see detail database for conversion.

## Usage

``` r
convert_icgc(
  x,
  from = "icgc_specimen_id",
  to = "icgc_donor_id",
  multiple = FALSE
)
```

## Arguments

- x:

  A character vector to convert.

- from:

  Which identifier type to be converted. One of icgc_sample_id,
  submitted_sample_id, icgc_specimen_id, submitted_specimen_id,
  icgc_donor_id, submitted_donor_id.

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
x <- convert_icgc("SP29019")
x
#> [1] "DO13695"
# }
if (FALSE) { # \dontrun{
convert_icgc("SA170678")
} # }
```
