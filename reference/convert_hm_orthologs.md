# Convert Gene IDs Between Human and Mouse via Orthology

Maps gene symbols or Ensembl IDs between human and mouse using Ensembl
BioMart orthology data. This resolves homologous gene relationships
(e.g., human TP53 \<-\> mouse Trp53).

## Usage

``` r
convert_hm_orthologs(
  IDs,
  from_species = c("human", "mouse"),
  to_species = c("mouse", "human"),
  from_type = c("symbol", "ensembl"),
  to_type = c("symbol", "ensembl", "both"),
  multiple = FALSE,
  high_confidence_only = TRUE,
  mirrors = ENSEMBL_MIRRORS,
  cache_dir = getOption("IDConverter.datapath", tempdir()),
  verbose = TRUE
)
```

## Arguments

- IDs:

  a character vector of gene symbols or Ensembl IDs.

- from_species:

  source species: `"human"` (default) or `"mouse"`.

- to_species:

  target species: `"mouse"` (default) or `"human"`. Must differ from
  `from_species`.

- from_type:

  type of input IDs: `"symbol"` (default) or `"ensembl"`.

- to_type:

  type of output IDs: `"symbol"` (default), `"ensembl"`, or `"both"` to
  return both columns.

- multiple:

  if `TRUE`, return a `data.frame` with all ortholog matches (e.g.,
  one-to-many relationships).

- high_confidence_only:

  if `TRUE` (default), restrict to orthologs with high confidence
  (confidence == 1) in Ensembl.

- mirrors:

  character vector of Ensembl mirror URLs.

- cache_dir:

  directory to cache query results. Set `NULL` to skip.

- verbose:

  if `TRUE`, print progress messages.

## Value

If `multiple = FALSE`, a character vector of converted IDs (NA for
unmatched). If `multiple = TRUE` or `to_type = "both"`, a `data.frame`.

## Details

**Requirements:** This function requires the Bioconductor package
biomaRt. Install it with:


    if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
    BiocManager::install("biomaRt")

Orthology data is queried live from Ensembl and cached locally.

## Examples

``` r
# \donttest{
# Human symbol -> mouse symbol
convert_hm_orthologs(c("TP53", "KRAS", "EGFR"))
#> Querying Ensembl BioMart for human->mouse orthologs...
#>   Trying mirror: https://www.ensembl.org
#>     OK: 3 rows
#>   Cached to: /tmp/RtmpLr937O/ortholog_human_to_mouse_symbol_symbol_hc.rda
#>    TP53    KRAS    EGFR 
#> "Trp53"  "Kras"  "Egfr" 

# Mouse symbol -> human symbol
convert_hm_orthologs(c("Trp53", "Kras"), from_species = "mouse", to_species = "human")
#> Querying Ensembl BioMart for mouse->human orthologs...
#>   Trying mirror: https://www.ensembl.org
#>     OK: 2 rows
#>   Cached to: /tmp/RtmpLr937O/ortholog_mouse_to_human_symbol_symbol_hc.rda
#>  Trp53   Kras 
#> "TP53" "KRAS" 

# Human Ensembl -> mouse Ensembl
convert_hm_orthologs("ENSG00000141510", from_type = "ensembl", to_type = "ensembl")
#> Querying Ensembl BioMart for human->mouse orthologs...
#>   Trying mirror: https://www.ensembl.org
#>     OK: 1 rows
#>   Cached to: /tmp/RtmpLr937O/ortholog_human_to_mouse_ensembl_ensembl_hc.rda
#>      ENSG00000141510 
#> "ENSMUSG00000059552" 
# }
```
