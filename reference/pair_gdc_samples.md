# Pair Tumor-Normal Samples from GDC Manifest

Parses a GDC manifest file (or result from
[`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md))
and creates paired tumor-normal sample information. This is useful for
generating matched pair lists for downstream genomic analyses.

## Usage

``` r
pair_gdc_samples(x, prefer_blood_normal = TRUE)
```

## Arguments

- x:

  a path to a GDC manifest file, a vector of GDC file UUIDs, or a
  `data.frame` returned by
  [`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md).

- prefer_blood_normal:

  if `TRUE` (default), prefer blood-derived normal samples over solid
  tissue normals when both are available for the same case.

## Value

a `data.frame` with columns:

- pair_id:

  unique pair identifier (generated from tumor sample ID)

- case_id:

  TCGA case (patient) ID (first 12 characters of barcode)

- tumor_sample:

  TCGA tumor sample barcode (first 15 characters), `NA` if no tumor for
  this case

- normal_sample:

  TCGA normal sample barcode (first 15 characters), `NA` if no normal
  for this case

- file_id_tumor:

  GDC file UUID for the tumor sample

- file_id_normal:

  GDC file UUID for the normal sample

- tissue_type:

  tissue type string from manifest (e.g. "Blood Derived Normal")

## Details

The function identifies tumor vs normal samples based on the TCGA
barcode: samples with position 14-15 less than `"10"` are classified as
tumor, others as normal. When both blood-derived and solid tissue
normals are available for a case, blood normal is preferred by default.

## Examples

``` r
# Mock data example (works offline)
mock <- data.frame(
  submitter_id = c("TCGA-02-0001-01B-02D-A271-08",
                   "TCGA-02-0001-10B-01D-A273-01"),
  sample_type  = c("Primary Tumor", "Blood Derived Normal"),
  file_id      = c("fe522fc8-e690-49b9-b3b6-fa3658705057",
                   "2c16506f-1110-4d60-81e3-a85233c79909"),
  stringsAsFactors = FALSE
)
pair_gdc_samples(mock)
#> # A tibble: 1 × 7
#>   pair_id        case_id tumor_sample normal_sample file_id_tumor file_id_normal
#>   <chr>          <chr>   <chr>        <chr>         <chr>         <chr>         
#> 1 TCGA-02-0001-… TCGA-0… TCGA-02-000… TCGA-02-0001… fe522fc8-e69… 2c16506f-1110…
#> # ℹ 1 more variable: tissue_type <chr>

if (FALSE) { # \dontrun{
# From a real GDC manifest file
info <- pair_gdc_samples("gdc_manifest.txt")
head(info)
} # }
```
