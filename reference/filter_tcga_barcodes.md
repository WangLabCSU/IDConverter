# Filter TCGA Replicate Sample Barcodes

Check details for filter rules.

## Usage

``` r
filter_tcga_barcodes(
  tsb,
  analyte_target = c("DNA", "RNA"),
  decreasing = TRUE,
  analyte_position = 20,
  plate = c(22, 25),
  portion = c(18, 19),
  filter_FFPE = FALSE
)
```

## Arguments

- tsb:

  a vector of TCGA sample barcodes.

- analyte_target:

  type of barcodes, "DNA" or "RNA".

- decreasing:

  if `TRUE` (default), use decreasing order to select barcode to keep.

- analyte_position:

  bit position for analyte. DON'T CHANGE IT if you don't understand.

- plate:

  bit position for plate. DON'T CHANGE IT if you don't understand.

- portion:

  bit position for portion. DON'T CHANGE IT if you don't understand.

- filter_FFPE:

  if `TRUE` (`FALSE` is default), filter out FFPE samples.

## Value

a barcode list.

## Details

In many instances there is more than one aliquot for a given combination
of individual, platform, and data type. However, only one aliquot may be
ingested into Firehose. Therefore, a set of precedence rules are applied
to select the most scientifically advantageous one among them. Two
filters are applied to achieve this aim: an Analyte Replicate Filter and
a Sort Replicate Filter.

### Analyte Replicate Filter

The following precedence rules are applied when the aliquots have
differing analytes. For RNA aliquots, T analytes are dropped in
preference to H and R analytes, since T is the inferior extraction
protocol. If H and R are encountered, H is the chosen analyte. This is
somewhat arbitrary and subject to change, since it is not clear at
present whether H or R is the better protocol. If there are multiple
aliquots associated with the chosen RNA analyte, the aliquot with the
later plate number is chosen. For DNA aliquots, D analytes (native DNA)
are preferred over G, W, or X (whole-genome amplified) analytes, unless
the G, W, or X analyte sample has a higher plate number.

### Sort Replicate Filter

The following precedence rules are applied when the analyte filter still
produces more than one sample. The sort filter chooses the aliquot with
the highest lexicographical sort value, to ensure that the barcode with
the highest portion and/or plate number is selected when all other
barcode fields are identical.

**NOTE**: Basically, user provides tsb and analyte_target is fine.

## References

Rules:

- `https://confluence.broadinstitute.org/display/GDAC/FAQ#FAQ-sampleTypesQWhatTCGAsampletypesareFirehosepipelinesexecutedupon`

FFPE cases:

- `http://gdac.broadinstitute.org/runs/sampleReports/latest/FPPP_FFPE_Cases.html`

## Examples

``` r
filter_tcga_barcodes(c("TCGA-44-2656-01B-06D-A271-08", "TCGA-44-2656-01B-06D-A273-01"))
#> ooo Filter barcodes successfully!
#> [1] "TCGA-44-2656-01B-06D-A273-01"
filter_tcga_barcodes(c("TCGA-44-2656-01B-06D-A271-08", "TCGA-44-2656-01B-06D-A273-01"),
  filter_FFPE = TRUE
)
#> ooo Not find any duplicated barcodes, return..
#> character(0)
```
