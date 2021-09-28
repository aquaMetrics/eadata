
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ead

<!-- badges: start -->
<!-- badges: end -->

The goal of ead is to access Environment Agency data from
environment.data.gov.uk website via an R package

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aquaMetrics/eadata")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ead)
## basic example to query observations from two sites
site_id = c("/environment.data.gov.uk/ecology/site/bio/43378",
      "/environment.data.gov.uk/ecology/site/bio/10254")
obs <- get_observations(site_id,
                        take = 10,
                        type_id = "http://environment.data.gov.uk/ecology/def/bio/RiverInvMetricsObservation")
obs[, c("date", "result.value")]
#>          date result.value
#> 1  2021-02-17         5.11
#> 2  2021-02-17         5.00
#> 3  2021-02-17        27.00
#> 4  2021-02-17       138.00
#> 5  2021-02-17        10.00
#> 6  2021-02-17         2.00
#> 7  2021-02-17         5.00
#> 8  2021-02-17        34.00
#> 9  2021-02-17        17.00
#> 10 2021-02-17         5.00
```
