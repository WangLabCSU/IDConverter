# Convert Identifiers with Custom Database

Convert Identifiers with Custom Database

## Usage

``` r
convert_custom(x, from = NULL, to = NULL, dt = NULL, multiple = FALSE)
```

## Arguments

- x:

  A character vector to convert.

- from:

  Which identifier type to be converted.

- to:

  Identifier type convert to.

- dt:

  A `data.frame` as database for conversion.

- multiple:

  if `TRUE`, return a `data.table` instead of a string vector, so
  multiple identifier mappings can be kept.

## Value

A character vector.

## Examples

``` r
dt <- data.table::data.table(UpperCase = LETTERS[1:5], LowerCase = letters[1:5])
dt
#>    UpperCase LowerCase
#>       <char>    <char>
#> 1:         A         a
#> 2:         B         b
#> 3:         C         c
#> 4:         D         d
#> 5:         E         e
x <- convert_custom(c("B", "C", "E", "E", "FF"), from = "UpperCase", to = "LowerCase", dt = dt)
x
#> [1] "b" "c" "e" "e" NA 
```
