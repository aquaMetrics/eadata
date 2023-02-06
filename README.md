
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ead

<!-- badges: start -->

[![R-CMD-check](https://github.com/aquaMetrics/eadata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/aquaMetrics/eadata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `eadata` is to access Environment Agency data from
environment.data.gov.uk website via an R package.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aquaMetrics/eadata", dependencies = TRUE)
```

## Example

This example shows you how to get freshwater observations using R:

``` r
library(eadata)
## basic example to query observations from two sites
site_id <- c(
  "http://environment.data.gov.uk/ecology/site/bio/43378",
  "http://environment.data.gov.uk/ecology/site/bio/10254"
)
obs <- get_observations(site_id,
  take = 10,
  type_id =
    "http://environment.data.gov.uk/ecology/def/bio/RiverInvMetricsObservation"
)
obs[, c("date", "result_value")]
#>          date result_value
#> 1  2021-09-30         4.79
#> 2  2021-09-30         5.00
#> 3  2021-09-30        24.00
#> 4  2021-09-30       115.00
#> 5  2021-09-30         8.10
#> 6  2021-09-30         1.62
#> 7  2021-09-30         5.00
#> 8  2021-09-30        34.00
#> 9  2021-09-30        21.00
#> 10 2021-09-30         5.00
```
