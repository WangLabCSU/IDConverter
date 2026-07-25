# List Available Annotation Tables

Lists all annotation tables that can be loaded via
[`load_data()`](https://wanglabcsu.github.io/IDConverter/reference/load_data.md)
from the Zenodo repository (fixed Ensembl version). For the latest
Ensembl annotations, use
[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
to query BioMart directly.

## Usage

``` r
ls_annotables()
```

## Value

a character vector of available table names.

## Details

These tables have basic annotation information from **Ensembl Genes**
for:

- Human build 38 (`grch38`)

- Human build 37 (`grch37`)

- Mouse (`grcm38`)

- Rat (`rnor6`)

- Chicken (`galgal5`)

- Worm (`wbcel235`)

- Fly (`bdgp6`)

- Macaque (`mmul801`) Where each table contains:

- `ensgene`: Ensembl gene ID

- `entrez`: Entrez gene ID

- `symbol`: Gene symbol

- `chr`: Chromosome

- `start`: Start

- `end`: End

- `strand`: Strand

- `biotype`: Protein coding, pseudogene, mitochondrial tRNA, etc.

- `description`: Full gene name/description Additionally, there are
  `tx2gene` tables that link Ensembl gene IDs to Ensembl transcript IDs.

Use
[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
to fetch the latest annotations from Ensembl BioMart, which also
supports additional organisms (dog, zebrafish, pig).

## References

<https://github.com/stephenturner/annotables>

## See also

[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
for live Ensembl BioMart queries.

## Examples

``` r
# \donttest{
ls_annotables()
#> Downloading https://zenodo.org/records/10360995/files/ensembl_version.rda to /tmp/Rtmpqed9np/ensembl_version.rda
#> Version: Ensembl Genes 105
#>  [1] "bdgp6"            "bdgp6_tx2gene"    "galgal5"          "galgal5_tx2gene" 
#>  [5] "grch37"           "grch37_tx2gene"   "grch38"           "grch38_tx2gene"  
#>  [9] "grcm38"           "grcm38_tx2gene"   "mmul801"          "mmul801_tx2gene" 
#> [13] "rnor6"            "rnor6_tx2gene"    "wbcel235"         "wbcel235_tx2gene"
load_data(ls_annotables()[1])
#> Version: Ensembl Genes 105
#> # A tibble: 28,759 × 9
#>    ensgene      entrez symbol     chr    start    end strand biotype description
#>    <chr>         <int> <chr>      <chr>  <int>  <int>  <int> <chr>   <chr>      
#>  1 FBgn0000003 3771948 7SLRNA:CR… 3R    6.82e6 6.82e6      1 ncRNA   Signal rec…
#>  2 FBgn0000008   43852 a          2R    2.21e7 2.22e7      1 protei… arc        
#>  3 FBgn0000014   42037 abd-A      3R    1.68e7 1.68e7     -1 protei… abdominal A
#>  4 FBgn0000015   47763 Abd-B      3R    1.69e7 1.70e7     -1 protei… Abdominal B
#>  5 FBgn0000017   45821 Abl        3L    1.66e7 1.66e7     -1 protei… Abl tyrosi…
#>  6 FBgn0000018   44793 abo        2L    1.10e7 1.10e7     -1 protei… abnormal o…
#>  7 FBgn0000018   76375 abo        2L    1.10e7 1.10e7     -1 protei… abnormal o…
#>  8 FBgn0000022   30981 ac         X     3.70e5 3.71e5      1 protei… achaete    
#>  9 FBgn0000024   41625 Ace        3R    1.32e7 1.33e7     -1 protei… Acetylchol…
#> 10 FBgn0000024   12038 Ace        3R    1.32e7 1.33e7     -1 protei… Acetylchol…
#> # ℹ 28,749 more rows
# }
```
