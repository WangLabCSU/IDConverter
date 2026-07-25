# PCAWG Full Sample Identifiers

PCAWG Full Sample Identifiers

## Format

A data frame with 7255 rows and 8 variables.

## Source

<https://dcc.icgc.org/releases/PCAWG>

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
# }
```
