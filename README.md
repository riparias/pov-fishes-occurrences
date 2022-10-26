[![funding](https://img.shields.io/static/v1?label=published+through&message=LIFE+RIPARIAS&labelColor=00a58d&color=ffffff)](https://www.riparias.be/)
[![fetch-data](https://github.com/riparias/pov-fishes-occurrences/actions/workflows/fetch-data.yaml/badge.svg)](https://github.com/riparias/pov-fishes-occurrences/actions/workflows/fetch-data.yaml)
[![mapping and testing](https://github.com/riparias/pov-fishes-occurrences/actions/workflows/mapping_and_testing.yaml/badge.svg)](https://github.com/riparias/pov-fishes-occurrences/actions/workflows/mapping_and_testing.yaml)

## Rationale

This repository contains the functionality to standardize the fishes and crayfishes data of the [Provincial Center of Environmental Research](https://oost-vlaanderen.be/wonen-en-leven/natuur-en-milieu/provinciaal-centrumvoormilieuonderzoek.html) (PCM) of the [Province East Flanders](https://www.oost-vlaanderen.be/) to a [Darwin Core Archive](https://ipt.gbif.org/manual/en/ipt/2.5/dwca-guide) that can be harvested by a [GBIF IPT](https://ipt.gbif.org/manual/en/ipt/2.5/).

## Workflow

[fetch data](https://github.com/riparias/pov-fishes-occurrences/tree/main/src/fetch_data.Rmd) from WFS → save them as local [source data](https://github.com/riparias/pov-fishes-occurrences/tree/main/data/raw) → Darwin Core [mapping script](https://github.com/riparias/pov-fishes-occurrences/tree/main/src/dwc_mapping.Rmd) → generated [Darwin Core files](https://github.com/riparias/pov-fishes-occurrences/tree/main/data/processed)


## Published dataset

* [Dataset on the IPT](#) - TBD
* [Dataset on GBIF](#) - TBD

## Repo structure

The repository structure is based on [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/) and the [Checklist recipe](https://github.com/trias-project/checklist-recipe). Files and directories indicated with `GENERATED` should not be edited manually.

```
├── README.md              : Description of this repository
├── LICENSE                : Repository license
├── pov-fishes-occurrences.Rproj : RStudio project file
├── .gitignore             : Files and directories to be ignored by git
│
├── .github                
│   ├── PULL_REQUEST_TEMPLATE.md : Pull request template
│   └── workflows
│   │   ├── fetch-data.yaml    : GitHub action to fetch raw data
│   │   └── mapping_and_testing.yaml : GitHub action to map data to DwC and perform some tests on the Dwc output
|
├── src
│   ├── fetch_data.Rmd     : Fetchin data script
│   ├── dwc_mapping.Rmd    : Darwin Core mapping script
│   ├── run_fetch_data.R   : R script to run code in fetch_data.Rmd in an automatic way within a GitHub action
│   ├── run_dwc_mapping.R  : R script to run code in dcw_mapping.Rmd in an automatic way within a GitHub action
│   └── install_packages.R : R script to install all needed packages
|
├── sql                    : Darwin Core transformations
│   └── dwc_event.sql
│   ├── dwc_occurrence.sql
│   └── dwc_mof.sql
│   
└── data
│   ├── raw                : Fetched data
│   └── processed          : Darwin Core output of mapping script GENERATED
```

## Installation

1. Clone this repository to your computer
2. Open the RStudio project file
3. Run `install_packages.R` to install any required packages
4. Open `fetch_data.Rmd` [R Markdown file](https://rmarkdown.rstudio.com/) in RStudio to fetch data manually
5. Open the `dwc_mapping.Rmd` [R Markdown file](https://rmarkdown.rstudio.com/) in RStudio to map data to DwC manually
6. Click `Run > Run All` to generate the processed data

## License

[MIT License](LICENSE) for the code and documentation in this repository. The included data is released under another license.
