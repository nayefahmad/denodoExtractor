
<!-- README.md is generated from README.Rmd. Please edit that file -->

# denodoExtractor

<!-- badges: start -->

<!-- badges: end -->

The goal of denodoExtractor is to …

## Installation

You can install the released version of denodoExtractor from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("denodoExtractor")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(denodoExtractor)
## basic example code
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
