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

  a path to a GDC manifest file, or a `data.frame` returned by
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
# \donttest{
# From a GDC manifest file
info <- pair_gdc_samples("gdc_manifest.txt")
#> Error: `x` must be a path to a GDC manifest file or a data.frame returned by parse_gdc_file_uuid().
head(info)
#> Error: object 'info' not found

# From a parse_gdc_file_uuid result
parsed <- parse_gdc_file_uuid("gdc_manifest.txt")
#> Error in parse_gdc_file_uuid("gdc_manifest.txt"): it seems your input file path does not exist!
info <- pair_gdc_samples(parsed)
#> Error: object 'parsed' not found
# }
```
