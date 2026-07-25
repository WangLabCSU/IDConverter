# Getting Started with IDConverter

## Overview

IDConverter converts identifiers within and between biological
databases. Core use cases:

- **TCGA/ICGC/PCAWG** sample ID conversion
- **Human ↔︎ Mouse** gene ortholog mapping
- **Gene symbol ↔︎ Ensembl ID** conversion
- **Gene alias** resolution
- **GDC manifest** parsing and tumor-normal pairing

## ID Conversion

``` r

library(IDConverter)

# TCGA sample ID → patient ID
convert_tcga("TCGA-02-0001-10")
#> [1] "TCGA-02-0001"

# ICGC specimen → donor
convert_icgc("SP29019")
#> [1] "DO13695"

# PCAWG specimen → donor
convert_pcawg("SP1677")
#> [1] "DO804"

# Custom database
dt <- data.table::data.table(
  UpperCase = LETTERS[1:5],
  LowerCase = letters[1:5]
)
convert_custom(c("B", "C", "E"), from = "UpperCase", to = "LowerCase", dt = dt)
#> [1] "b" "c" "e"
```

## Gene ID Conversion

``` r

# Symbol → Ensembl (human)
convert_hm_genes(c("TP53", "KRAS"), type = "symbol")

# Ensembl → Symbol (human)
convert_hm_genes("ENSG00000141510")

# Human → Mouse orthologs
convert_hm_orthologs(c("TP53", "KRAS"))
```

## Gene Annotation Tables

``` r

# List available tables
ls_annotables()

# Load from Zenodo (fixed version, works offline)
grch38 <- load_data("grch38")

# Or build from Ensembl BioMart (latest, requires biomaRt + internet)
grch38_latest <- build_annotables("grch38", tx2gene = FALSE)
```
