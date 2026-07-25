# Parse Sample ID from GDC Portal File UUID

Parse Sample ID from GDC Portal File UUID

## Usage

``` r
parse_gdc_file_uuid(
  x,
  legacy = FALSE,
  fields = "cases.samples.submitter_id,cases.samples.sample_type,file_id",
  token = NULL,
  max_try = 5L
)
```

## Arguments

- x:

  a GDC manifest file or a vector of file UUIDs.

- legacy:

  if use GDC legacy data.

- fields:

  a list of fields to query. If it is a string, then fields should be
  separated by comma. It could also be a vector. See
  <https://docs.gdc.cancer.gov/API/Users_Guide/Appendix_A_Available_Fields/#file-fields>
  for list.

- token:

  the token used for querying.

- max_try:

  maximum try time.

## Value

a `data.frame`

## See also

[`pair_gdc_samples()`](https://wanglabcsu.github.io/IDConverter/reference/pair_gdc_samples.md)
for pairing tumor-normal samples from the parsed manifest result.

## Examples

``` r
if (FALSE) { # \dontrun{
parse_gdc_file_uuid("fe522fc8-e690-49b9-b3b6-fa3658705057")
parse_gdc_file_uuid(
  c(
    "fe522fc8-e690-49b9-b3b6-fa3658705057",
    "2c16506f-1110-4d60-81e3-a85233c79909"
  )
)
} # }
```
