library(knitr)

# create temporary R file
tempR <- tempfile(fileext = ".R")
knitr::purl("./src/dwc_mapping.Rmd", output=tempR)
source(tempR)
unlink(tempR)
