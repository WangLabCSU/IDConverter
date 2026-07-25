# PCAWG Mutation Related Simplified Sample Identifiers

This dataset contains less records than `data("pcawg_full")` but with
more ID columns. Of note, only white-list donors included.

## Format

A data frame with 2583 rows and 12 variables.

## Source

<https://www.nature.com/articles/s41586-020-1969-6>

## Examples

``` r
# \donttest{
load_data("pcawg_simple")
#>                 tumour_specimen_aliquot_id           normal_specimen_aliquot_id
#>                                     <char>                               <char>
#>    1: 0009b464-b376-4fbc-8a56-da538269a02f 5ef2ed4d-464e-4a51-95e0-401d9ae7be86
#>    2: 003819bc-c415-4e76-887c-931d60ed39e7 9a1c7950-69c9-4f27-800c-8bd834bc3d08
#>    3: 0040b1b6-b07a-4b6e-90ef-133523eaf412 64d942b9-eb38-4c98-8999-4b682377ee85
#>    4: 00493087-9d9d-40ca-86d5-936f1b951c93 d5dfac45-4aff-481d-9117-807ed47b7b10
#>    5: 00508f2b-36bf-44fc-b66b-97e1f3e40bfa a3cc9015-6131-417c-8b71-e6028a4646bd
#>   ---                                                                          
#> 2579: ff870342-f0d6-4450-8f9c-344c046a0baf 8d6563a5-9777-4b2a-a4ac-00b59e6729ff
#> 2580: ffa976f0-aa60-4867-842e-361afa7d68ac 36021aee-1b89-4d5d-94a8-6b9db44a4448
#> 2581: ffad9288-c622-11e3-bf01-24c6515278c0 ff27bf50-c622-11e3-bf01-24c6515278c0
#> 2582: ffdd4feb-aca3-4104-b1e8-954d705a6450 db3bb39b-a1a6-49af-aae3-7cb489a724e4
#> 2583: ffe4bb51-e98a-41a7-a4e1-c3970386889c 15c19e49-6f79-4a67-ab31-3075f38c8432
#>                                     donor_unique_id submitted_donor_id
#>                                              <char>             <char>
#>    1:                               OV-AU::AOCS-117           AOCS-117
#>    2:                           PBCA-DE::ICGC_PA107         ICGC_PA107
#>    3:                                 LINC-JP::HX17               HX17
#>    4:  LGG-US::fc3b7596-f515-446f-81db-fed0154ca2c5       TCGA-EZ-7264
#>    5:                            PAEN-AU::ICGC_0498          ICGC_0498
#>   ---                                                                 
#> 2579:                             PRAD-CA::CPCG0208           CPCG0208
#> 2580:                                  CLLE-ES::151                151
#> 2581:                                LIRI-JP::RK172              RK172
#> 2582: BLCA-US::cce62116-3dcd-400d-ada0-9839ca02466e       TCGA-FT-A3EE
#> 2583:                            PACA-CA::PCSI_0326          PCSI_0326
#>       icgc_donor_id icgc_sample_id icgc_specimen_id submitted_specimen_id
#>              <char>         <char>           <char>                <char>
#>    1:       DO46416       SA505245         SP101724           AOCS-117-13
#>    2:       DO36062       SA413814          SP79365            ICGC_PA107
#>    3:       DO45049       SA501385          SP98853                 HX17T
#>    4:       DO22145       SA262459          SP47708      TCGA-EZ-7264-01A
#>    5:       DO48578       SA514933         SP106808               8068611
#>   ---                                                                    
#> 2579:       DO51079       SA530530         SP112845           CPCG0208-F1
#> 2580:       DO52704       SA542175         SP116740            151-02-8TD
#> 2581:       DO23552       SA270468          SP50185             RK172_C01
#> 2582:         DO720         SA4138           SP1491      TCGA-FT-A3EE-01A
#> 2583:       DO51503       SA533736         SP125738    PCSI_0326_Pa_P_526
#>                submitted_sample_id                   tcga_specimen_uuid
#>                             <char>                               <char>
#>    1:                 AOCS-117-3-3                                 <NA>
#>    2:                   ICGC_PA107                                 <NA>
#>    3:                        HX17T                                 <NA>
#>    4: TCGA-EZ-7264-01A-11D-2024-08 eecba415-5517-4265-8944-07aacbc679fb
#>    5:                      8068611                                 <NA>
#>   ---                                                                  
#> 2579:                  CPCG0208-F1                                 <NA>
#> 2580:                   151-02-8TD                                 <NA>
#> 2581:                    RK172_C01                                 <NA>
#> 2582: TCGA-FT-A3EE-01A-11D-A202-08 2356f78c-0653-468f-83db-6cf6107bd259
#> 2583:           PCSI_0326_Pa_P_526                                 <NA>
#>                           tcga_sample_uuid                      tcga_donor_uuid
#>                                     <char>                               <char>
#>    1:                                 <NA>                                 <NA>
#>    2:                                 <NA>                                 <NA>
#>    3:                                 <NA>                                 <NA>
#>    4: 00493087-9d9d-40ca-86d5-936f1b951c93 fc3b7596-f515-446f-81db-fed0154ca2c5
#>    5:                                 <NA>                                 <NA>
#>   ---                                                                          
#> 2579:                                 <NA>                                 <NA>
#> 2580:                                 <NA>                                 <NA>
#> 2581:                                 <NA>                                 <NA>
#> 2582: ffdd4feb-aca3-4104-b1e8-954d705a6450 cce62116-3dcd-400d-ada0-9839ca02466e
#> 2583:                                 <NA>                                 <NA>
# }
```
