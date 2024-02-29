
<!-- README.md is generated from README.Rmd. Please edit that file -->

# interlacer

## Overview

interlacer provides a convenient and typesafe API for loading and
manipulating textual tabular data sources interlaced values and missing
reasons. This library is currently in its experimental stages, so be
aware that its interface is likely to change in the future. In the
meantime, please try it out and [let me know what you
think](https://github.com/khusmann/interlacer/discussions)!

## Installation

``` r
# The easiest way to get interlacer is to install via devtools:

install.packages("devtools") # If devtools is not already installed

devtools::install_github("khusmann/interlacer")
```

## Usage

To use interlacer, load it into your current R session:

``` r
library(interlacer)
```

interlacer supports the following file formats with these
`read_interlaced_*()` functions, which extend the `readr::read_*()`
family of functions:

- `read_interlaced_csv()`: comma-separated values (CSV)
- `read_interlaced_tsv()`: tab-separated values (TSV)
- `read_interlaced_csv2()`: semicolon-separated values with `,` as the
  decimal mark
- `read_interlaced_delim()`: delimited files (CSV and TSV are important
  special cases)

The following example loads a sample file bundled with interlacer that
interlaces values with three possible missing reasons: “REFUSED”,
“OMITTED”, and “N/A”.

``` r
colors_example <- read_interlaced_csv(
  interlacer_example("colors.csv"),
  na = c("REFUSED", "OMITTED", "N/A")
)
```
