# TCGA Case Identifiers

How to get the dataset can be viewed in code under `data-raw`. Cases in
`case_id` column can be directly mapped to a GDC portal page, e.g.
<https://portal.gdc.cancer.gov/cases/30a1fe5e-5b12-472c-aa86-c2db8167ab23>.

## Format

A data frame with 150849 rows and 5 variables.

## Source

<https://portal.gdc.cancer.gov/>

## Examples

``` r
# \donttest{
load_data("tcga")
#>                                      case_id
#>                                       <char>
#>      1: 30a1fe5e-5b12-472c-aa86-c2db8167ab23
#>      2: 30a1fe5e-5b12-472c-aa86-c2db8167ab23
#>      3: 30a1fe5e-5b12-472c-aa86-c2db8167ab23
#>      4: 30a1fe5e-5b12-472c-aa86-c2db8167ab23
#>      5: 30a1fe5e-5b12-472c-aa86-c2db8167ab23
#>     ---                                     
#> 150845: 4756acc0-4e96-44d4-b359-04d64dc7eb84
#> 150846: 4756acc0-4e96-44d4-b359-04d64dc7eb84
#> 150847: 4756acc0-4e96-44d4-b359-04d64dc7eb84
#> 150848: 4756acc0-4e96-44d4-b359-04d64dc7eb84
#> 150849: 4756acc0-4e96-44d4-b359-04d64dc7eb84
#>                                  aliquot_ids        submitter_aliquot_ids
#>                                       <char>                       <char>
#>      1: bab8561e-b84b-4f77-abbd-0053b44a7cb1 TCGA-02-0001-10A-01W-0188-10
#>      2: ffd8c4e1-f515-4406-b2be-19a87b60b295 TCGA-02-0001-01C-01R-0179-07
#>      3: 9b62c8ff-549c-48ae-8893-8bde079acec0 TCGA-02-0001-01C-01R-0676-04
#>      4: f50bd78c-039d-483c-aae6-d56a74e9911e TCGA-02-0001-01C-01D-0888-01
#>      5: baa8958d-ebc9-4df7-83d8-2fc3782ac980 TCGA-02-0001-10A-01W-0190-09
#>     ---                                                                  
#> 150845: 212eae3c-4ad5-48e0-90af-b6fe1dfc5554 TCGA-ZX-AA5X-01A-11R-A42T-07
#> 150846: 13f9434b-5c9f-4767-99f0-5b4528ead4a0 TCGA-ZX-AA5X-10A-01D-A42Q-01
#> 150847: d4539dbc-3874-4649-9dc6-bd27f21581fd TCGA-ZX-AA5X-01A-11R-A42V-13
#> 150848: 6d72c3e1-cb80-4c1d-852f-bb5337af1fdf TCGA-ZX-AA5X-01A-11D-A42P-05
#> 150849: d305bae2-19f6-440c-9eb9-f0395a2b3a2d TCGA-ZX-AA5X-01A-11D-A42N-01
#>         submitter_id       sample_id
#>               <char>          <char>
#>      1: TCGA-02-0001 TCGA-02-0001-10
#>      2: TCGA-02-0001 TCGA-02-0001-01
#>      3: TCGA-02-0001 TCGA-02-0001-01
#>      4: TCGA-02-0001 TCGA-02-0001-01
#>      5: TCGA-02-0001 TCGA-02-0001-10
#>     ---                             
#> 150845: TCGA-ZX-AA5X TCGA-ZX-AA5X-01
#> 150846: TCGA-ZX-AA5X TCGA-ZX-AA5X-10
#> 150847: TCGA-ZX-AA5X TCGA-ZX-AA5X-01
#> 150848: TCGA-ZX-AA5X TCGA-ZX-AA5X-01
#> 150849: TCGA-ZX-AA5X TCGA-ZX-AA5X-01
# }
```
