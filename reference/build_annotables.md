# Build Gene Annotation Tables from Ensembl BioMart

Queries Ensembl BioMart directly to build up-to-date gene annotation
tables ("annotables") using recipes derived from the
[annotables](https://github.com/stephenturner/annotables) package. This
provides the latest annotations from Ensembl when internet is available,
as an alternative to the fixed-version tables stored on Zenodo.

## Usage

``` r
build_annotables(
  recipes = NULL,
  tx2gene = TRUE,
  include_synonyms = FALSE,
  mirrors = ENSEMBL_MIRRORS,
  cache_dir = getOption("IDConverter.datapath", tempdir()),
  verbose = TRUE
)
```

## Arguments

- recipes:

  character vector of recipe names to build, or `NULL` to build all
  available recipes. Use
  [`ls_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/ls_annotables.md)
  to see which organisms are available (matching the "gene" + "tx2gene"
  table names). Recipe names include `"grch38"`, `"grch37"`, `"grcm38"`,
  `"bdgp6"`, `"galgal5"`, `"rnor6"`, `"mmul801"`, `"wbcel235"`,
  `"cfamiliaris"`, `"drerio"`, `"sscrofa"`.

- tx2gene:

  if `TRUE` (default), also build transcript-to-gene mapping tables
  (appended with `_tx2gene` suffix).

- include_synonyms:

  if `TRUE`, also fetch `external_synonym` (gene name aliases) from
  BioMart and include a `synonym` column in the output tables. Default
  `FALSE` for faster queries.

- mirrors:

  character vector of Ensembl mirror URLs to try in order. The function
  automatically falls back to the next mirror on failure.

- cache_dir:

  directory path to cache downloaded tables as `.rda` files. Set to
  `NULL` to skip caching. Default uses the package's data path
  (customizable via `options(IDConverter.datapath = ...)`).

- verbose:

  if `TRUE`, print progress messages.

## Value

a named list of `data.frame` objects (tibbles). The list names
correspond to recipe names (and `_tx2gene` variants if
`tx2gene = TRUE`). Returns `invisible(NULL)` on total failure.

## Details

**Requirements:** This function requires the Bioconductor package
biomaRt. Install it with:


    if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
    BiocManager::install("biomaRt")

**Mirror fallback:** Ensembl mirrors can be unreliable. The function
tries each mirror in `mirrors` for each recipe until one succeeds. If
all mirrors fail for a recipe, that recipe is skipped with a warning.

**Caching:** When `cache_dir` is set, successfully downloaded tables are
saved as `.rda` files. Subsequent calls with the same `cache_dir` will
load from cache instead of re-querying, unless `cache_dir = NULL`.

## References

- <https://github.com/stephenturner/annotables>

- <https://www.ensembl.org/info/data/biomart.html>

## See also

[`load_data()`](https://wanglabcsu.github.io/IDConverter/reference/load_data.md)
for loading fixed-version tables from Zenodo,
[`ls_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/ls_annotables.md)
for listing available tables.

## Examples

``` r
# \donttest{
# Build a single annotable table
grch38 <- build_annotables("grch38", tx2gene = FALSE)
#> --- Building: grch38 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 91743 rows
#>   Cached to: /tmp/RtmpLr937O/grch38.rda
#> 
#> Successfully built 1 table(s). Use names() to see available tables.
head(grch38[[1]])
#> # A tibble: 6 × 9
#>   ensgene         entrez symbol chr      start    end strand biotype description
#>   <chr>            <int> <chr>  <chr>    <int>  <int>  <int> <chr>   <chr>      
#> 1 ENSG00000000003   7105 TSPAN6 X       1.01e8 1.01e8     -1 protei… tetraspani…
#> 2 ENSG00000000005  64102 TNMD   X       1.01e8 1.01e8      1 protei… tenomodulin
#> 3 ENSG00000000419   8813 DPM1   20      5.09e7 5.10e7     -1 protei… dolichyl-p…
#> 4 ENSG00000000457  57147 SCYL3  1       1.70e8 1.70e8     -1 protei… SCY1 like …
#> 5 ENSG00000000460  55732 FIRRM  1       1.70e8 1.70e8      1 protei… FIGNL1 int…
#> 6 ENSG00000000938   2268 FGR    1       2.76e7 2.76e7     -1 protei… FGR proto-…

# Build all available tables (requires internet + biomaRt)
all_tables <- build_annotables()
#> --- Building: grch38 ---
#>   Loading from cache: /tmp/RtmpLr937O/grch38.rda
#> --- Building: grch37 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 91743 rows
#>   Cached to: /tmp/RtmpLr937O/grch37.rda
#> --- Building: grcm38 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 78718 rows
#>   Cached to: /tmp/RtmpLr937O/grcm38.rda
#> --- Building: rnor6 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 57760 rows
#>   Cached to: /tmp/RtmpLr937O/rnor6.rda
#> --- Building: bdgp6 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 28759 rows
#>   Cached to: /tmp/RtmpLr937O/bdgp6.rda
#> --- Building: galgal5 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 34332 rows
#>   Cached to: /tmp/RtmpLr937O/galgal5.rda
#> --- Building: mmul801 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 37169 rows
#>   Cached to: /tmp/RtmpLr937O/mmul801.rda
#> --- Building: wbcel235 ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 46926 rows
#>   Cached to: /tmp/RtmpLr937O/wbcel235.rda
#> --- Building: cfamiliaris ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 34012 rows
#>   Cached to: /tmp/RtmpLr937O/cfamiliaris.rda
#> --- Building: drerio ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 92137 rows
#>   Cached to: /tmp/RtmpLr937O/drerio.rda
#> --- Building: sscrofa ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 35819 rows
#>   Cached to: /tmp/RtmpLr937O/sscrofa.rda
#> --- Building: grch38_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 670670 rows
#>   Cached to: /tmp/RtmpLr937O/grch38_tx2gene.rda
#> --- Building: grch37_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 670670 rows
#>   Cached to: /tmp/RtmpLr937O/grch37_tx2gene.rda
#> --- Building: grcm38_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 481956 rows
#>   Cached to: /tmp/RtmpLr937O/grcm38_tx2gene.rda
#> --- Building: rnor6_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 95472 rows
#>   Cached to: /tmp/RtmpLr937O/rnor6_tx2gene.rda
#> --- Building: bdgp6_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 41600 rows
#>   Cached to: /tmp/RtmpLr937O/bdgp6_tx2gene.rda
#> --- Building: galgal5_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 72689 rows
#>   Cached to: /tmp/RtmpLr937O/galgal5_tx2gene.rda
#> --- Building: mmul801_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 64228 rows
#>   Cached to: /tmp/RtmpLr937O/mmul801_tx2gene.rda
#> --- Building: wbcel235_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 60000 rows
#>   Cached to: /tmp/RtmpLr937O/wbcel235_tx2gene.rda
#> --- Building: cfamiliaris_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 55335 rows
#>   Cached to: /tmp/RtmpLr937O/cfamiliaris_tx2gene.rda
#> --- Building: drerio_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     OK: 65905 rows
#>   Cached to: /tmp/RtmpLr937O/drerio_tx2gene.rda
#> --- Building: sscrofa_tx2gene ---
#>   Trying mirror: https://www.ensembl.org
#>     Failed: HTTP 405 Method Not Allowed.
#>   Trying mirror: https://asia.ensembl.org
#>     OK: 60440 rows
#>   Cached to: /tmp/RtmpLr937O/sscrofa_tx2gene.rda
#> 
#> Successfully built 22 table(s). Use names() to see available tables.
names(all_tables)
#>  [1] "grch38"              "grch37"              "grcm38"             
#>  [4] "rnor6"               "bdgp6"               "galgal5"            
#>  [7] "mmul801"             "wbcel235"            "cfamiliaris"        
#> [10] "drerio"              "sscrofa"             "grch38_tx2gene"     
#> [13] "grch37_tx2gene"      "grcm38_tx2gene"      "rnor6_tx2gene"      
#> [16] "bdgp6_tx2gene"       "galgal5_tx2gene"     "mmul801_tx2gene"    
#> [19] "wbcel235_tx2gene"    "cfamiliaris_tx2gene" "drerio_tx2gene"     
#> [22] "sscrofa_tx2gene"    
# }
```
