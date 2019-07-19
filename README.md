
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
```

## Example

This is a basic example which shows you how to set up the Denodo ODBC
connection and pull admits data; todo:

``` r
library(denodoExtractor)
setup_denodo()

# should return 3 views: vw_adtc, vw_census, vw_eddata
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
