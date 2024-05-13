
<!-- README.md is generated from README.Rmd. Please edit that file -->

# interlacer <img src="man/figures/logo.svg" align="right" height="140" />

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/khusmann/interlacer/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/khusmann/interlacer/actions/workflows/check-standard.yaml)
[![codecov](https://codecov.io/gh/khusmann/interlacer/graph/badge.svg?token=R4WNWH5NXU)](https://codecov.io/gh/khusmann/interlacer)

When a value is missing in your data, sometimes you want to know *why*
it is missing. Many textual tabular data sources will encode missing
reasons as special values *interlaced* with the regular values in a
column (e.g. `N/A`, `REFUSED`, `-99`, etc.). Unfortunately, the missing
reasons are lost when these values are all converted into a single `NA`
type. Working with missing reasons in R traditionally requires loading
variables as character vectors and doing a bunch of string comparisons
and type conversions to make sense of them.

Interlacer provides functions that load variables from interlaced data
sources into a new `interlaced` column type that simultaneously holds
values and `NA` reasons as separate *channels* of the same variables. In
most contexts you can treat `interlaced` columns as if they were regular
values: if you take the `mean` of an interlaced column, you get the mean
of its values, without its missing reasons interfering in the
computation.

But unlike a regular column, the missing reasons are still available in
an `interlaced` column. This means you can still generate summary
statistics with breakdowns by missing reason, or filter data frames on
variables by specific missing reasons. In other words, you no longer
have to constantly manually include / exclude missing reasons in
computations by filtering them with awkward string comparisons or type
conversions… everything just works!

Although this may seem like a simple premise on the surface, it has deep
implications. In addition to the introduction in
`#vignette("interlacer")` be sure to also check out:

- `#vignette("mutations")` for a discussion on how to motify data frames
  when in this format

- `#vignette("column-types")` to see how to handle variable-level
  missing reasons

- `#vignette("coded-data")` for some recipies for working with coded
  data (e.g. data produced by SPSS, SAS or Stata)

- `#vignette("other-approaches")` for a deep dive into how interlacer’s
  approach compares to other approaches for representing and
  manipulating missing reasons alongside data values

This library is currently in its experimental stages, so be aware that
its interface is likely to change in the future. In the meantime, please
try it out and [let me know what you think](mailto:kdh38@psu.edu)!

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

- `read_interlaced_csv()`
- `read_interlaced_tsv()`
- `read_interlaced_csv2()`
- `read_interlaced_delim()`

As a quick demo, consider the following example file bundled with
interlacer:

``` r
library(dplyr)
#> Warning: package 'dplyr' was built under R version 4.2.3
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(readr)
#> Warning: package 'readr' was built under R version 4.2.3

read_file(interlacer_example("colors.csv")) |>
  cat()
#> person_id,age,favorite_color
#> 1,20,BLUE
#> 2,REFUSED,BLUE
#> 3,21,REFUSED
#> 4,30,OMITTED
#> 5,1,N/A
#> 6,41,RED
#> 7,50,OMITTED
#> 8,30,YELLOW
#> 9,REFUSED,REFUSED
#> 10,OMITTED,RED
#> 11,10,REFUSED
```

In this csv file, values are interlaced with three possible missing
reasons: `REFUSED`, `OMITTED`, and `N/A`.

With readr, loading these data would result in a data frame like this:

``` r
read_csv(
  interlacer_example("colors.csv"),
  na = c("REFUSED", "OMITTED", "N/A")
)
#> Rows: 11 Columns: 3
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): favorite_color
#> dbl (2): person_id, age
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 11 × 3
#>    person_id   age favorite_color
#>        <dbl> <dbl> <chr>         
#>  1         1    20 BLUE          
#>  2         2    NA BLUE          
#>  3         3    21 <NA>          
#>  4         4    30 <NA>          
#>  5         5     1 <NA>          
#>  6         6    41 RED           
#>  7         7    50 <NA>          
#>  8         8    30 YELLOW        
#>  9         9    NA <NA>          
#> 10        10    NA RED           
#> 11        11    10 <NA>
```

With interlacer, we get a “deinterlaced data frame” instead:

``` r
(ex <- read_interlaced_csv(
  interlacer_example("colors.csv"),
  na = c("REFUSED", "OMITTED", "N/A")
))
#> Rows: 11 Columns: 3
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): favorite_color
#> dbl (2): person_id, age
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 11 × 3
#>    person_id       age favorite_color
#>    <dbl,chr> <dbl,chr> <chr,chr>     
#>  1         1        20 BLUE          
#>  2         2 <REFUSED> BLUE          
#>  3         3        21 <REFUSED>     
#>  4         4        30 <OMITTED>     
#>  5         5         1 <N/A>         
#>  6         6        41 RED           
#>  7         7        50 <OMITTED>     
#>  8         8        30 YELLOW        
#>  9         9 <REFUSED> <REFUSED>     
#> 10        10 <OMITTED> RED           
#> 11        11        10 <REFUSED>
```

Deinterlaced data frames have two columns for each variable: one for
values, and another for missing reasons. Missing reason columns are
denoted by column names surrounded by dots (e.g. `.age.` is the missing
reason for the `age` column). When a value is `NA`, it always has a
reason in the missing reason column. Similarly, when a missing reason is
`NA`, it always has a value in the value column.

This allows us to separately reference values and missing reasons in a
tidy and type-aware manner. For example, if I wanted to get a breakdown
of the mean age of respondents missing a report of their favorite color,
grouped by the missing reason, it would simply be:

``` r
ex |>
  summarize(
    mean_age = mean(age, na.rm=T),
    n = n(),
    .by = favorite_color
  ) %>%
  arrange(favorite_color)
#> # A tibble: 6 × 3
#>   favorite_color mean_age     n
#>   <chr,chr>         <dbl> <int>
#> 1 BLUE               20       2
#> 2 RED                41       2
#> 3 YELLOW             30       1
#> 4 <N/A>               1       1
#> 5 <OMITTED>          40       2
#> 6 <REFUSED>          15.5     3
```

(Note that the `<NA>` category in the result refers to the mean age of
responses *without* missing color values, i.e. with available favorite
color responses).

But this just scratches the surface of what can be done with interlacer…
check out `vignette("interlacer")` for a more complete overview!

## Related Work

In other words, `interlaced` columns are effectively an implementation
of generic [`Result` type
vectors](https://en.wikipedia.org/wiki/Result_type) in R.

## Known Issues

Large data frames (many columns & rows) are slow to run and print with
interlacer. Deinterlaced data frames are validated to check that they
conform to the rule of “one value OR missing reason per row”, and this
check is done completely in R. There are a few key places (noted in the
source) that would extremely benefit from a native implementation, and
make the library much more snappy. Before I invest the time in that
though, I want to get enough feedback from users of this package to
stabilize the current approach / API. (If you find this package useful,
please [let me know](mailto:kdh38@psu.edu)!)

In the meantime, if your deinterlaced data frames are too slow to print,
you can disable row-level validation by setting this option in your
current session:

``` r
options(interlacer.print_validation = FALSE)
```

When `interlacer.print_validation = FALSE`, you will need to be extra
careful during mutations, because if you create an invalid state you
won’t get a warning!

## Acknowledgements

The development of this software was supported, in whole or in part, by
the Institute of Education Sciences, U.S. Department of Education,
through Grant R305A170047 to The Pennsylvania State University. The
opinions expressed are those of the authors and do not represent the
views of the Institute or the U.S. Department of Education.
