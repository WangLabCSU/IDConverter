# ICGC Sample Identifiers

ICGC Sample Identifiers

## Format

A data frame with 155874 rows and 6 variables.

## Source

<https://dcc.icgc.org/repositories>

## Examples

``` r
# \donttest{
load_data("icgc")
#>         icgc_sample_id          submitted_sample_id icgc_specimen_id
#>                 <char>                       <char>           <char>
#>      1:       SA170678 TCGA-02-0104-01A-01G-0295-06          SP29019
#>      2:       SA170653 TCGA-02-0104-01A-01T-0301-07          SP29019
#>      3:       SA170728 TCGA-02-0104-01A-01R-0299-03          SP29019
#>      4:       SA170688 TCGA-02-0104-01A-01G-0296-02          SP29019
#>      5:       SA170698 TCGA-02-0104-01A-01G-0326-02          SP29019
#>     ---                                                             
#> 155870:       SA539137 TCGA-94-8490-01A-11H-2325-13         SP115145
#> 155871:       SA539135 TCGA-94-8490-01A-11D-2323-08         SP115145
#> 155872:       SA539140 TCGA-94-8490-10A-01D-2322-01         SP115146
#> 155873:       SA539141 TCGA-94-8490-10A-01D-2323-08         SP115146
#> 155874:       SA539142 TCGA-94-8490-10A-01W-2345-08         SP115146
#>         submitted_specimen_id icgc_donor_id submitted_donor_id
#>                        <char>        <char>             <char>
#>      1:      TCGA-02-0104-01A       DO13695       TCGA-02-0104
#>      2:      TCGA-02-0104-01A       DO13695       TCGA-02-0104
#>      3:      TCGA-02-0104-01A       DO13695       TCGA-02-0104
#>      4:      TCGA-02-0104-01A       DO13695       TCGA-02-0104
#>      5:      TCGA-02-0104-01A       DO13695       TCGA-02-0104
#>     ---                                                       
#> 155870:      TCGA-94-8490-01A       DO52021       TCGA-94-8490
#> 155871:      TCGA-94-8490-01A       DO52021       TCGA-94-8490
#> 155872:      TCGA-94-8490-10A       DO52021       TCGA-94-8490
#> 155873:      TCGA-94-8490-10A       DO52021       TCGA-94-8490
#> 155874:      TCGA-94-8490-10A       DO52021       TCGA-94-8490
# }
```
