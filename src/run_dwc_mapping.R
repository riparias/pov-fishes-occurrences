#' R code to automatically run all chunks of dwc_mapping.Rmd

# load required packages (install them if needed)
installed <- rownames(installed.packages())
required <- c("knitr")
if (!all(required %in% installed)) {
  install.packages(required[!required %in% installed])
}
library(knitr)

# create temporary R file
tempR <- tempfile(fileext = ".R")
knitr::purl("./src/dwc_mapping.Rmd", output=tempR)
source(tempR)
unlink(tempR)
