# Load Data from Local or Remote Zenodo Repository

Data are stored in remote [Zenodo
repo](https://zenodo.org/records/10360995). This function will help
download required data and load it into R. For datasets bundled with the
package (`tcga`, `icgc`, `pcawg_full`, `pcawg_simple`), local data is
used directly without network access.

## Usage

``` r
load_data(x)
```

## Arguments

- x:

  a dataset name.

## Value

typically a `data.frame`, depends on `x`.

## Note

The Zenodo repository contains fixed-version data. For the latest
Ensembl gene annotations, use
[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
to query BioMart directly.

## See also

[`build_annotables()`](https://wanglabcsu.github.io/IDConverter/reference/build_annotables.md)
for live Ensembl BioMart queries.

## Examples

``` r
# \donttest{
load_data("pcawg_full")
#>                                     donor_unique_id
#>                                              <char>
#>    1: BLCA-US::096b4f32-10c1-4737-a0dd-cae04c54ee33
#>    2: BLCA-US::096b4f32-10c1-4737-a0dd-cae04c54ee33
#>    3: BLCA-US::096b4f32-10c1-4737-a0dd-cae04c54ee33
#>    4: BLCA-US::178b28cd-99c3-48dc-8d09-1ef71b4cee80
#>    5: BLCA-US::178b28cd-99c3-48dc-8d09-1ef71b4cee80
#>   ---                                              
#> 7251: UCEC-US::fba80122-d8b2-4d8d-a032-9767e8160f9f
#> 7252: UCEC-US::fba80122-d8b2-4d8d-a032-9767e8160f9f
#> 7253: UCEC-US::ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38
#> 7254: UCEC-US::ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38
#> 7255: UCEC-US::ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38
#>                         submitter_donor_id icgc_donor_id
#>                                     <char>        <char>
#>    1: 096b4f32-10c1-4737-a0dd-cae04c54ee33         DO804
#>    2: 096b4f32-10c1-4737-a0dd-cae04c54ee33         DO804
#>    3: 096b4f32-10c1-4737-a0dd-cae04c54ee33         DO804
#>    4: 178b28cd-99c3-48dc-8d09-1ef71b4cee80         DO555
#>    5: 178b28cd-99c3-48dc-8d09-1ef71b4cee80         DO555
#>   ---                                                   
#> 7251: fba80122-d8b2-4d8d-a032-9767e8160f9f       DO42544
#> 7252: fba80122-d8b2-4d8d-a032-9767e8160f9f       DO42544
#> 7253: ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38       DO42432
#> 7254: ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38       DO42432
#> 7255: ffaa98a0-2b69-46dc-aee5-c5c3f2abbc38       DO42432
#>                                 aliquot_id                submitter_specimen_id
#>                                     <char>                               <char>
#>    1: e0fccaf5-925a-41f9-b87c-cd5ee4aecb59 27461a27-26eb-4c2c-9c54-e16fbd32c615
#>    2: 301d6ce3-4099-4c1d-8e50-c04b7ce91450 52f538ef-b05d-4c76-9976-ce6d49158016
#>    3: 22e154de-0e3b-443b-8420-48d68d6c1ce4 52f538ef-b05d-4c76-9976-ce6d49158016
#>    4: c1da8eed-4919-4ba5-a735-3fba476c18a7 cd3cfb26-e66f-408e-81f6-3b61c247c976
#>    5: 4838b5a9-968c-4178-bffb-3fafe1f6dc09 59d6683f-5eb7-493d-8e8e-78b88be2cd70
#>   ---                                                                          
#> 7251: e54b7e44-82a3-4016-bc32-129799097b4c ddd2f9e0-0aa3-425b-9d74-74fcc638cb08
#> 7252: ce5b0ba0-2777-4c92-ac50-483174cc5dca cad6c89d-f722-470b-93bc-e8b24c033f0f
#> 7253: 47f826a1-96ed-4f4d-94e0-49f4460ef44f 2729ed97-f971-4d98-8baa-f99404dd2b9f
#> 7254: 712ba532-fb1a-43fa-a356-b446b509ceb7 8bb3a057-8958-4f62-af81-976da2e92df7
#> 7255: ca81a393-ec7d-4538-a64a-417ed188a320 8bb3a057-8958-4f62-af81-976da2e92df7
#>       icgc_specimen_id                  submitter_sample_id icgc_sample_id
#>                 <char>                               <char>         <char>
#>    1:           SP1682 e0fccaf5-925a-41f9-b87c-cd5ee4aecb59         SA5237
#>    2:           SP1677 301d6ce3-4099-4c1d-8e50-c04b7ce91450         SA5195
#>    3:           SP1677 22e154de-0e3b-443b-8420-48d68d6c1ce4         SA5213
#>    4:           SP1135 c1da8eed-4919-4ba5-a735-3fba476c18a7         SA1598
#>    5:           SP1132 4838b5a9-968c-4178-bffb-3fafe1f6dc09         SA1556
#>   ---                                                                     
#> 7251:          SP92947 e54b7e44-82a3-4016-bc32-129799097b4c       SA462448
#> 7252:          SP92955 ce5b0ba0-2777-4c92-ac50-483174cc5dca       SA462509
#> 7253:          SP92731 47f826a1-96ed-4f4d-94e0-49f4460ef44f       SA461078
#> 7254:          SP92723 712ba532-fb1a-43fa-a356-b446b509ceb7       SA461016
#> 7255:          SP92723 ca81a393-ec7d-4538-a64a-417ed188a320       SA461038
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
