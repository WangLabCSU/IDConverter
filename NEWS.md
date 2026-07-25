# IDConverter 0.3.5

* Removed from CRAN.
* Removed hard code of the `.data_path` in the package.

## CRAN Resubmission

* Bundled real data files in `data/` (tcga, icgc, pcawg_full, pcawg_simple)
  instead of empty placeholders — core functions now work fully offline.
* `load_data()` now loads bundled datasets directly via `utils::data()`,
  falling back to Zenodo download only for non-bundled data.
* Added `LazyDataCompression: xz` to DESCRIPTION to comply with CRAN policy
  for lazy data larger than 1 MB.
* Wrapped `parse_gdc_file_uuid()` examples in `\dontrun{}` to prevent
  network access during R CMD check.
* `ls_annotables()` and `convert_hm_genes()` now handle offline state
  gracefully with informative messages.
* Updated Zenodo record URL from 6342397 to 10360995 (`/records/` format).

## New Features

* Added `build_annotables()` — builds up-to-date gene annotation tables
  directly from Ensembl BioMart using recipes from the annotables package.
  Supports 11 organisms (including dog, zebrafish, pig) with mirror
  fallback and local caching. Requires `biomaRt` (Bioconductor).
* `convert_hm_genes()` now supports `ce11` (C. elegans) and `T2T`
  (human T2T/CHM13) genome builds.

# IDConverter 0.3.4

* Suppressed the check warning and error.

# IDConverter 0.3.3

* Printed more reasonable message when network is not available.

# IDConverter 0.3.2

* Enhanced `parse_gdc_file_uuid()`.

# IDConverter 0.3.1

* Re-implemented `parse_gdc_file_uuid()`.

# IDConverter 0.3.0

* Used tempdir as user default data directory.
* Supported [annotables](https://github.com/stephenturner/annotables) annotation data tables by combining newly created `ls_annotables()` and `load_data()`.
* Added `convert_hm_genes()` - Convert human/mouse gene IDs between Ensembl and Hugo Symbol system.

# IDConverter 0.2.0

* Added `filter_tcga_barcodes` for TCGA barcode filtering.
* Moved all data to Zenodo `https://zenodo.org/record/6336671` to keep this package smaller.

# IDConverter 0.1.1

* Added `parse_gdc_file_uuid()` to "Parse Metadata from GDC Portal File UUID".
* Added `multiple` option to return a map `data.table`.

# IDConverter 0.1.0

* Added `convert_custom()` to allow user construct custom database for conversion.
* Added `convert_icgc()`.
* Added `convert_pcawg()`.
* Added `convert_tcga()`.

# IDConverter 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
