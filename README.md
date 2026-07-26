
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IDConverter

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/IDConverter)](https://cran.r-project.org/package=IDConverter)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![](https://cranlogs.r-pkg.org/badges/grand-total/IDConverter?color=orange)](https://cran.r-project.org/package=IDConverter)
[![R-CMD-check](https://github.com/WangLabCSU/IDConverter/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/WangLabCSU/IDConverter/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of IDConverter is to convert identifiers between biological
databases. Currently, I mainly use it for promoting cancer study.

## Installation

You can install IDConverter from CRAN:

``` r
install.packages("IDConverter")
```

Or install the development version from GitHub:

``` r
remotes::install_github("WangLabCSU/IDConverter")
```

Or Gitee (better in China, but updates may lag behind):

``` r
remotes::install_git("https://gitee.com/ShixiangWang/IDConverter")
```

## Available features

**ID conversions**:

- `convert_custom()` - Convert custom database identifiers.
- `convert_icgc()` - Convert ICGC identifiers.
- `convert_pcawg()` - Convert PCAWG identifiers.
- `convert_tcga()` - Convert TCGA identifiers.
- `convert_hm_genes()` - Convert human/mouse/worm gene IDs between
  Ensembl and Hugo Symbol system.
- `convert_hm_orthologs()` - Convert gene IDs between human and mouse
  via Ensembl orthology (e.g., TP53 ↔ Trp53).

**Annotation tables**:

- `ls_annotables()` - List available annotation tables from
  [annotables](https://github.com/stephenturner/annotables).
- `load_data()` - Download and load annotation data from Zenodo (fixed
  version) or from local cache.
- `build_annotables()` - Build up-to-date gene annotation tables
  directly from Ensembl BioMart (supports 11 organisms, requires
  `biomaRt`).
- `resolve_gene_aliases()` - Resolve outdated/alternative gene symbols
  (aliases) to official symbols via Ensembl synonym data.

**Utilities**:

- `pair_gdc_samples()` - Pair tumor-normal samples from GDC manifest
  files.
- `parse_gdc_file_uuid()` - Parse Metadata from GDC Portal File UUID.
- `filter_tcga_barcodes()` - Filter TCGA Replicate Sample Barcodes.

## Examples

``` r
library(IDConverter)
```

To follow the CRAN policy, I have to set `tempdir()` as default data
path, however, I recommend you set the data path to a specified path
with `options(IDConverter.datapath)`.

e.g.,

``` r
options(IDConverter.datapath = system.file("extdata", package = "IDConverter"))
```

### TCGA

``` r
x <- convert_tcga("TCGA-02-0001-10")
x
#> [1] "TCGA-02-0001"
```

### PCAWG

``` r
x <- convert_pcawg("SP1677")
x
#> [1] "DO804"
```

### ICGC

``` r
x <- convert_icgc("SP29019")
x
#> [1] "DO13695"
```

### Genes

``` r
convert_hm_genes(c("TP53", "KRAS", "EGFR", "MYC"), type = "symbol")
#> Downloading https://zenodo.org/records/10360995/files/human_hg38_gene_info.rds to /private/var/folders/1w/371ktd8j0fv8mp_dsgtvssnw0000gn/T/RtmplHcuKU/temp_libpath13eb7262c040d/IDConverter/extdata/human_hg38_gene_info.rds
#> [1] "ENSG00000141510" "ENSG00000133703" "ENSG00000146648" "ENSG00000136997"

# Or use data from annotables
ls_annotables()
#> Downloading https://zenodo.org/records/10360995/files/ensembl_version.rda to /private/var/folders/1w/371ktd8j0fv8mp_dsgtvssnw0000gn/T/RtmplHcuKU/temp_libpath13eb7262c040d/IDConverter/extdata/ensembl_version.rda
#> Version: Ensembl Genes 105
#>  [1] "bdgp6"            "bdgp6_tx2gene"    "galgal5"          "galgal5_tx2gene" 
#>  [5] "grch37"           "grch37_tx2gene"   "grch38"           "grch38_tx2gene"  
#>  [9] "grcm38"           "grcm38_tx2gene"   "mmul801"          "mmul801_tx2gene" 
#> [13] "rnor6"            "rnor6_tx2gene"    "wbcel235"         "wbcel235_tx2gene"
grch37 = load_data("grch37")
#> Downloading https://zenodo.org/records/10360995/files/grch37.rda to /private/var/folders/1w/371ktd8j0fv8mp_dsgtvssnw0000gn/T/RtmplHcuKU/temp_libpath13eb7262c040d/IDConverter/extdata/grch37.rda
head(grch37)
#> # A tibble: 6 × 9
#>   ensgene         entrez symbol   chr    start    end strand biotype description
#>   <chr>            <int> <chr>    <chr>  <int>  <int>  <int> <chr>   <chr>      
#> 1 ENSG00000000003   7105 TSPAN6   X     1.01e8 1.01e8     -1 protei… tetraspani…
#> 2 ENSG00000000005  64102 TNMD     X     1.01e8 1.01e8      1 protei… tenomodulin
#> 3 ENSG00000000419   8813 DPM1     20    5.09e7 5.10e7     -1 protei… dolichyl-p…
#> 4 ENSG00000000457  57147 SCYL3    1     1.70e8 1.70e8     -1 protei… SCY1 like …
#> 5 ENSG00000000460  55732 C1orf112 1     1.70e8 1.70e8      1 protei… chromosome…
#> 6 ENSG00000000938   2268 FGR      1     2.76e7 2.76e7     -1 protei… FGR proto-…
convert_custom(c("TP53", "KRAS", "EGFR", "MYC"),
               from = "symbol", to = "entrez", dt = grch37)
#> [1] "7157" "3845" "1956" "4609"
```

### Human-Mouse Orthologs

``` r
# Human → Mouse
convert_hm_orthologs(c("TP53", "KRAS", "EGFR", "MYC"))
# => Trp53, Kras, Egfr, Myc

# Mouse → Human
convert_hm_orthologs(c("Trp53", "Kras"), from_species = "mouse", to_species = "human")
# => TP53, KRAS

# Ensembl ID mapping
convert_hm_orthologs("ENSG00000141510", from_type = "ensembl", to_type = "ensembl")
# => ENSMUSG00000059552
```

### Gene Symbol Aliases

``` r
# Build annotation table with synonym support
ann <- build_annotables("grch38", include_synonyms = TRUE, tx2gene = FALSE)

# Resolve aliases (e.g., old names → official symbols)
resolve_gene_aliases(c("TP53", "T245", "MLL"), ann[[1]])
# T245 → TSPAN6, MLL → KMT2A (if in synonym data)
```

### GDC Manifest Pairing

``` r
# Pair tumor-normal samples from a GDC manifest file
info <- pair_gdc_samples("gdc_manifest.txt")
head(info)
```

## Citation

***Wang S, Li H, Song M, Tao Z, Wu T, He Z, et al. (2021) Copy number
signature analysis tool and its application in prostate cancer reveals
distinct mutational processes and clinical outcomes. PLoS Genet 17(5):
e1009557.*** <https://doi.org/10.1371/journal.pgen.1009557>

## Similar package

- [AnnoProbe](https://github.com/jmzeng1314/AnnoProbe/) ([Gitee
  mirror](https://gitee.com/jmzeng/annoprobe)) is an R package for
  transforming Chips probes to different Gene IDs.

## LICENSE

MIT@2020, Shixiang Wang
