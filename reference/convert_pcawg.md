# Convert PCAWG Identifiers

Run `data("pcawg_full")` or `data("pcawg_simple")` to see detail
database for conversion. The `pcawg_simple` database only contains PCAWG
white-list donors.

## Usage

``` r
convert_pcawg(
  x,
  from = "icgc_specimen_id",
  to = "icgc_donor_id",
  db = c("full", "simple"),
  multiple = FALSE
)
```

## Arguments

- x:

  A character vector to convert.

- from:

  Which identifier type to be converted. For db "full", one of
  donor_unique_id, submitter_donor_id, icgc_donor_id, aliquot_id,
  submitter_specimen_id, icgc_specimen_id, submitter_sample_id,
  icgc_sample_id. For db "simple", one of tumour_specimen_aliquot_id,
  normal_specimen_aliquot_id, donor_unique_id, submitted_donor_id,
  icgc_donor_id, icgc_sample_id, icgc_specimen_id,
  submitted_specimen_id, submitted_sample_id, tcga_specimen_uuid,
  tcga_sample_uuid, tcga_donor_uuid.

- to:

  Identifier type convert to. Same as parameter `from`.

- db:

  Database, one of "full" (for `data("pcawg_full")`) or "simple" (for
  `data("pcawg_simple")`).

- multiple:

  if `TRUE`, return a `data.table` instead of a string vector, so
  multiple identifier mappings can be kept.

## Value

A character vector.

## Examples

``` r
# \donttest{
x <- convert_pcawg("SP1677")
x
#> [1] "DO804"

y <- convert_pcawg("DO804",
  from = "icgc_donor_id",
  to = "icgc_specimen_id", multiple = TRUE
)
y
#>      from     to
#>    <char> <char>
#> 1:  DO804 SP1682
#> 2:  DO804 SP1677
# }
if (FALSE) { # \dontrun{
convert_pcawg("SA5213")
} # }
```
