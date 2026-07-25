# Convert Gene IDs between Ensembl and Hugo Symbol System

Supports human (hg38, hg19, T2T), mouse (mm10, mm9), and worm (ce11, C.
elegans) genomes.

## Usage

``` r
convert_hm_genes(
  IDs,
  type = c("ensembl", "symbol"),
  genome_build = c("hg38", "hg19", "mm10", "mm9", "ce11", "T2T"),
  multiple = FALSE
)
```

## Arguments

- IDs:

  a character vector to convert.

- type:

  type of input `IDs`, could be 'ensembl' or 'symbol'.

- genome_build:

  reference genome build.

- multiple:

  if `TRUE`, return a `data.table` instead of a string vector, so
  multiple identifier mappings can be kept.

## Value

a vector or a `data.table`.

## Note

This function matches against **primary** gene symbols only. For
resolving outdated or alternative gene names (aliases like "MLL" -\>
"KMT2A"), use
[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
with `include_synonyms = TRUE` followed by
[`resolve_gene_aliases()`](https://wanglabcsu.github.io/IDConverter/reference/resolve_gene_aliases.md).

## See also

[`resolve_gene_aliases()`](https://wanglabcsu.github.io/IDConverter/reference/resolve_gene_aliases.md)
for resolving gene symbol aliases.

## Examples

``` r
# \donttest{
convert_hm_genes("ENSG00000243485")
#> Downloading https://zenodo.org/records/10360995/files/human_hg38_gene_info.rds to /tmp/RtmpLr937O/human_hg38_gene_info.rds
#> [1] "MIR1302-2HG"
convert_hm_genes("ENSG00000243485", multiple = TRUE)
#>               from          to
#>             <char>      <char>
#> 1: ENSG00000243485 MIR1302-2HG
convert_hm_genes(c("TP53", "KRAS", "EGFR", "MYC"), type = "symbol")
#> [1] "ENSG00000141510" "ENSG00000133703" "ENSG00000146648" "ENSG00000136997"
# }
```
