# get packages installed on machine
installed <- rownames(installed.packages())
# specify packages we need
required <- c("dplyr", "readr", "purrr", "stringr", "here",
              "glue", "DBI", "RSQLite", "digest", "tidylog",
              "httr", "ows4R", # to get data via WFS
              "sf", # to convert coordinate system
              "knitr", # to extract R code from Rmd in run_*.R files
              "testthat" # to run tests in test_dwc_occurrence.R
)
# install packages if needed
if (!all(required %in% installed)) {
  pkgs_to_install <- required[!required %in% installed]
  print(paste("Packages to install:", paste(pkgs_to_install, collapse = ", ")))
  install.packages(pkgs_to_install)
}
