# Resolve Gene Symbol Aliases

Maps gene symbols through known aliases (synonyms) to their current
official symbols and Ensembl gene IDs. This helps when working with
outdated or alternative gene names (e.g., "MLL" -\> "KMT2A").

## Usage

``` r
resolve_gene_aliases(symbols, annotable, multiple = FALSE)
```

## Arguments

- symbols:

  a character vector of gene symbols to resolve.

- annotable:

  a `data.frame` from
  [`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
  with `include_synonyms = TRUE`. Must contain `symbol` and `synonym`
  columns.

- multiple:

  if `TRUE`, return a `data.frame` with all matches (including cases
  where one alias maps to multiple genes).

## Value

a `data.frame` (tibble) with columns:

- query:

  the input gene symbols

- symbol:

  resolved official gene symbol (`NA` if unmatched)

- ensgene:

  resolved Ensembl gene ID (`NA` if unmatched)

When `multiple = TRUE`, each row is a single query-\>match pair, so one
query may appear in multiple rows.

## Examples

``` r
# \donttest{
# Build annotables with synonym support
ann <- build_annotables("grch38", include_synonyms = TRUE, tx2gene = FALSE)
#> --- Building: grch38 ---
#>   Trying mirror: https://useast.ensembl.org
#>     Failed: HTTP 403 Forbidden.
#>   Trying mirror: https://uswest.ensembl.org
#>     Failed: Failed to perform HTTP request.
#> Caused by error in `curl::curl_fetch_memory()`:
#> ! SSL peer certificate or SSH remote key was not OK [uswest.ensembl.org]:
#> SSL certificate problem: certificate has expired
#>   Trying mirror: https://www.ensembl.org
#>     OK: 133458 rows
#>   Cached to: /tmp/RtmpgblwcJ/grch38_syn.rda
#> 
#> Successfully built 1 table(s). Use names() to see available tables.

# Resolve aliases
resolve_gene_aliases(c("TP53", "MLL", "NOTAGENE"), ann[[1]])
#> # A tibble: 3 × 3
#>   query    symbol ensgene        
#>   <chr>    <chr>  <chr>          
#> 1 TP53     TP53   ENSG00000141510
#> 2 MLL      KMT2A  ENSG00000118058
#> 3 NOTAGENE NA     NA             

# Multiple match mode
resolve_gene_aliases(c("TP53", "MLL"), ann[[1]], multiple = TRUE)
#> # A tibble: 2 × 3
#>   query symbol ensgene        
#>   <chr> <chr>  <chr>          
#> 1 TP53  TP53   ENSG00000141510
#> 2 MLL   KMT2A  ENSG00000118058
# }
```
