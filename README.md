
<!-- README.md is generated from README.Rmd. Please edit that file -->

# denodoExtractor

<!-- badges: start -->

<!-- badges: end -->

The goal of denodoExtractor is to make it easy to pull common patient
flow metrics from denodo views into R. Examples include daily ED visits,
admits/census/discharges for specified nursing units, etc.

## Installation

You can install the package from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("nayefahmad/denodoExtractor")
#> Skipping install of 'denodoExtractor' from a github remote, the SHA1 (1caa9696) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Example

This is a basic example which shows you how to set up the Denodo ODBC
connection and pull admits data. I assume you have set up the Denodo
ODBC Driver, and that you have a ODBC connection named
“cnx\_denodo\_spappcsta001”. If you have a different name, you can
pass that to the `dsn_name` argument of the `setup_denodo()` function.

First, let’s set up our ODBC connection:

``` r
library(denodoExtractor)
#> Loading required package: magrittr

# first set up odbc: 
setup_denodo()
# should return 3 views: vw_adtc, vw_census, vw_eddata
```

Let’s pull admits to major LGH units in January:

``` r
extract_admits("20190101", "20190201")
#> # A tibble: 59 x 4
#>     date_id nursing_unit_cd metric value
#>       <int> <chr>           <chr>  <int>
#>  1 20190101 LGH 3E          admits     2
#>  2 20190102 LGH 3E          admits     1
#>  3 20190103 LGH 3E          admits     4
#>  4 20190103 LGH 3W          admits     1
#>  5 20190103 LGH 6W          admits     1
#>  6 20190104 LGH 3E          admits     4
#>  7 20190104 LGH 3W          admits     1
#>  8 20190104 LGH 7E          admits     1
#>  9 20190105 LGH 3E          admits     2
#> 10 20190106 LGH 3E          admits     3
#> # ... with 49 more rows
```

Now let’s try VGH ECC unit instead:

``` r
extract_admits("20190101", 
               "20190115",
               site = "Vancouver General Hospital", 
               n_units = "ECC")
#> # A tibble: 10 x 4
#>     date_id nursing_unit_cd metric value
#>       <int> <chr>           <chr>  <int>
#>  1 20190102 ECC             admits    22
#>  2 20190103 ECC             admits    22
#>  3 20190104 ECC             admits    22
#>  4 20190107 ECC             admits    27
#>  5 20190108 ECC             admits    23
#>  6 20190109 ECC             admits    27
#>  7 20190110 ECC             admits    24
#>  8 20190111 ECC             admits    27
#>  9 20190114 ECC             admits    16
#> 10 20190115 ECC             admits    19
```

## Getting help

To see a list of all available functions, use the following:

``` r
# help(package = "denodoExtractor")
```

To see documentation for a specific function, use a question mark
followed by the function name in the console. For example:

``` r
# ?setup_denodo
# ?extract_admits
```

## Notes on package development

### Problems with filepaths

You may run into an error like `UNC paths are not supported. Defaulting
to Windows directory`. What seems to work is to go into Tools \> Project
Options \> Build toold \> Package directory, and set the folder path
*without using paths that start with “vch.ca”*. For example, use
`H:/denodoExtractor`

### Git problems

When using `usethis::use_github`, by default, your .git folder will have
a file named `pre-commit` in it. This tells git to do the checks
specified there before you can commit anything. Unfortunately, this
seems to create problems with using RStudio or GitHub desktop to
commit/push. You will have to use git bash with command `git commit
--no-verify`. There’s no way to specify this command in GUIs.

To get around this, simply add .sample at the end of the filename:
pre-commit.sample. Now it will be ignored by GitHub.

### Package installation errors

You may get an error saying: `Error: failed to install package X ...
cannot remove prior installation of package`. If this happens, just
manually install the package in console using `install.packages(package
name)`
