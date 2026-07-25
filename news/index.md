# Changelog

## IDConverter 0.4.0

### CRAN Resubmission

- Bundled real data files in `data/` (tcga, icgc, pcawg_full,
  pcawg_simple) instead of empty placeholders — core functions now work
  fully offline.
- [`load_data()`](https://wanglabcsu.github.io/IDConverter/reference/load_data.md)
  now loads bundled datasets directly via
  [`utils::data()`](https://rdrr.io/r/utils/data.html), falling back to
  Zenodo download only for non-bundled data.
- Added `LazyDataCompression: xz` to DESCRIPTION to comply with CRAN
  policy for lazy data larger than 1 MB.
- Wrapped
  [`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md)
  examples in `\dontrun{}` to prevent network access during R CMD check.
- [`ls_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/ls_annotables.md)
  and
  [`convert_hm_genes()`](https://wanglabcsu.github.io/IDConverter/reference/convert_hm_genes.md)
  now handle offline state gracefully with informative messages.
- Updated Zenodo record URL from 6342397 to 10360995 (`/records/`
  format).
- Added `biocViews:` field to DESCRIPTION for Bioconductor
  compatibility.

### New Features

- Added
  [`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
  — builds up-to-date gene annotation tables directly from Ensembl
  BioMart using recipes from the annotables package. Supports 11
  organisms (including dog, zebrafish, pig) with mirror fallback and
  local caching. Requires `biomaRt` (Bioconductor).
- Added
  [`pair_gdc_samples()`](https://wanglabcsu.github.io/IDConverter/reference/pair_gdc_samples.md)
  — pairs tumor-normal samples from GDC manifest files. Automatically
  classifies tumor vs normal by TCGA barcode, prefers blood-derived
  normals, and generates all tumor-normal combinations per case.
  ([\#7](https://github.com/WangLabCSU/IDConverter/issues/7))
- [`convert_hm_genes()`](https://wanglabcsu.github.io/IDConverter/reference/convert_hm_genes.md)
  now supports `ce11` (C. elegans) and `T2T` (human T2T/CHM13) genome
  builds.
- Added
  [`resolve_gene_aliases()`](https://wanglabcsu.github.io/IDConverter/reference/resolve_gene_aliases.md)
  — resolves outdated or alternative gene symbols (e.g., “MLL” -\>
  “KMT2A”) using Ensembl synonym data. Requires
  `build_annotables(include_synonyms = TRUE)` for source data.
  ([\#11](https://github.com/WangLabCSU/IDConverter/issues/11))
- [`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
  gains `include_synonyms` parameter to fetch `external_synonym` from
  Ensembl BioMart.
- Added
  [`convert_hm_orthologs()`](https://wanglabcsu.github.io/IDConverter/reference/convert_hm_orthologs.md)
  — converts gene symbols or Ensembl IDs between human and mouse via
  Ensembl orthology (e.g., TP53 \<-\> Trp53). Supports high-confidence
  filtering and cached queries.

### Other Changes

- Repository migrated from `ShixiangWang/IDConverter` to
  `WangLabCSU/IDConverter`. All URLs updated in DESCRIPTION, README,
  pkgdown config, and documentation.
- All Rd files regenerated via `devtools::document()` for consistency.
- Added `IDConverter.Rcheck/` to `.gitignore` and `.Rbuildignore`.

## IDConverter 0.3.5

- Removed from CRAN.
- Removed hard code of the `.data_path` in the package.

## IDConverter 0.3.4

CRAN release: 2023-03-14

- Suppressed the check warning and error.

## IDConverter 0.3.3

CRAN release: 2022-08-15

- Printed more reasonable message when network is not available.

## IDConverter 0.3.2

CRAN release: 2022-06-03

- Enhanced
  [`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md).

## IDConverter 0.3.1

- Re-implemented
  [`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md).

## IDConverter 0.3.0

CRAN release: 2022-03-11

- Used tempdir as user default data directory.
- Supported [annotables](https://github.com/stephenturner/annotables)
  annotation data tables by combining newly created
  [`ls_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/ls_annotables.md)
  and
  [`load_data()`](https://wanglabcsu.github.io/IDConverter/reference/load_data.md).
- Added
  [`convert_hm_genes()`](https://wanglabcsu.github.io/IDConverter/reference/convert_hm_genes.md) -
  Convert human/mouse gene IDs between Ensembl and Hugo Symbol system.

## IDConverter 0.2.0

CRAN release: 2022-03-09

- Added `filter_tcga_barcodes` for TCGA barcode filtering.
- Moved all data to Zenodo `https://zenodo.org/record/6336671` to keep
  this package smaller.

## IDConverter 0.1.1

- Added
  [`parse_gdc_file_uuid()`](https://wanglabcsu.github.io/IDConverter/reference/parse_gdc_file_uuid.md)
  to “Parse Metadata from GDC Portal File UUID”.
- Added `multiple` option to return a map `data.table`.

## IDConverter 0.1.0

- Added
  [`convert_custom()`](https://wanglabcsu.github.io/IDConverter/reference/convert_custom.md)
  to allow user construct custom database for conversion.
- Added
  [`convert_icgc()`](https://wanglabcsu.github.io/IDConverter/reference/convert_icgc.md).
- Added
  [`convert_pcawg()`](https://wanglabcsu.github.io/IDConverter/reference/convert_pcawg.md).
- Added
  [`convert_tcga()`](https://wanglabcsu.github.io/IDConverter/reference/convert_tcga.md).

## IDConverter 0.0.0.9000

- Added a `NEWS.md` file to track changes to the package.
