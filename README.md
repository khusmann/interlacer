
<!-- README.md is generated from README.Rmd. Please edit that file -->

# interlacer <img src="man/figures/logo.svg" align="right" />

## Overview

When a value is missing in your data, sometimes you want to know *why*
it is missing. Many textual tabular data sources will encode missing
reasons as special values *interlaced* with the regular values in a
column (e.g. `N/A`, `REFUSED`, `-99`, etc.). Unfortunately, the missing
reasons are lost when these values are all converted into a single `NA`
type. Working with missing reasons has traditionally required loading
all variables as character vectors and doing a bunch of string
operations and type conversions to make sense of them.

Interlacer was created based on the insight that values and missing
reasons can be handled as separate *channels* of the same variable.
Interlacer provides functions that load variables from interlaced data
sources into two separate columns: One containing the variable’s values,
the other containing its missing reasons. As it turns out, this
structure gives us an extremely powerful and expressive way to
simultaneously work with values and missing reasons in tidy pipelines,
as described in `vignette("interlacer")`. (tldr: It allows us to
interact with a variable as a [`Result`
type](https://en.wikipedia.org/wiki/Result_type), an abstraction often
found in functional programming)

This library is currently in its experimental stages, so be aware that
its interface is likely to change in the future. In the meantime, please
try it out and [let me know what you
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

- `read_interlaced_csv()`
- `read_interlaced_tsv()`
- `read_interlaced_csv2()`
- `read_interlaced_delim()`

The following example loads a sample file bundled with interlacer that
interlaces values with three possible missing reasons: `REFUSED`,
`OMITTED`, and `N/A`.

``` r
(ex <- read_interlaced_csv(
  interlacer_example("colors.csv"),
  na = c("REFUSED", "OMITTED", "N/A")
))
#> # An deinterlaced tibble: 11 × 6
#>    person_id .person_id.   age .age.   favorite_color .favorite_color.
#>        <dbl> <fct>       <dbl> <fct>   <chr>          <fct>           
#>  1         1 <NA>           20 <NA>    BLUE           <NA>            
#>  2         2 <NA>           NA REFUSED BLUE           <NA>            
#>  3         3 <NA>           21 <NA>    RED            <NA>            
#>  4         4 <NA>           30 <NA>    <NA>           OMITTED         
#>  5         5 <NA>            1 <NA>    <NA>           N/A             
#>  6         6 <NA>           41 <NA>    RED            <NA>            
#>  7         7 <NA>           50 <NA>    <NA>           OMITTED         
#>  8         8 <NA>           30 <NA>    YELLOW         <NA>            
#>  9         9 <NA>           NA REFUSED <NA>           REFUSED         
#> 10        10 <NA>           NA OMITTED RED            <NA>            
#> 11        11 <NA>           10 <NA>    <NA>           REFUSED
```

As you can see, each source variable is loaded into two columns: one for
vaild values, and the other for missing reasons. Missing reason columns
are denoted by column names surrounded by dots (e.g. `.age.` is the
missing reason for the `age` column). When a value is `NA`, it always
has a reason in the missing reason column. Similarly, when a missing
reason is `NA`, it always has a value in the value column.

This allows us to separately reference values and missing reasons in a
tidy and type-aware manner. For example, if I wanted to get a breakdown
of the mean age of respondents missing a report of their favorite color,
grouped by the missing reason, it would simply be:

``` r
ex |>
  summarize(
    mean_age = mean(age, na.rm=T),
    n = n(),
    .by = .favorite_color.
  )
#> # A tibble: 4 × 3
#>   .favorite_color. mean_age     n
#>   <fct>               <dbl> <int>
#> 1 <NA>                   28     6
#> 2 OMITTED                40     2
#> 3 N/A                     1     1
#> 4 REFUSED                10     2
```

(Note that the `<NA>` category in the result refers to the mean age of
responses *without* missing color values, i.e. with available favorite
color responses).

But this just scratches the surface of what can be done with interlacer…
check out `vignette("interlacer")` for a more complete overview!

## Known Issues

Large dataframes (many columns & rows) run slowly with interlacer. This
is because the current implementation is written entirely in R. There
are a few key places (noted in the source) that would extremely benefit
from a native implementation, and make the library much more snappy.
Before I invest the time in that though, I want to get enough feedback
from users of this package to stabilize the current approach / API. (If
you find this package useful, please [let me
know](https://github.com/khusmann/interlacer/discussions)!)
