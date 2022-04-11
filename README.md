[![funding](https://img.shields.io/static/v1?label=published+through&message=LIFE+RIPARIAS&labelColor=00a58d&color=ffffff)](https://www.riparias.be/)

## Rationale

This repository contains the functionality to standardize the fishes data of the [Province East Flanders](https://www.oost-vlaanderen.be/) (POV) to a [Darwin Core Archive](https://ipt.gbif.org/manual/en/ipt/2.5/dwca-guide) that can be harvested by a [GBIF IPT](https://ipt.gbif.org/manual/en/ipt/2.5/).

## Workflow

[source data](data/raw) → Darwin Core [mapping script](src/dwc_mapping.Rmd) → generated [Darwin Core files](data/processed)

## Published dataset

* [Dataset on the IPT](#) - TBD
* [Dataset on GBIF](#) - TBD

## Repo structure

The repository structure is based on [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/) and the [Checklist recipe](https://github.com/trias-project/checklist-recipe). Files and directories indicated with `GENERATED` should not be edited manually.

```
├── README.md                           : Description of this repository
├── LICENSE                             : Repository license
├── pov-fishes-occurrences.Rproj    : RStudio project file
├── .gitignore                          : Files and directories to be ignored by git
│
├── src
│   └── dwc_mapping.Rmd    : Darwin Core mapping script
|
├── sql                    : Darwin Core transformations
│   ├── dwc_event.sql
│   ├── dwc_occurrence.sql
│   └── dwc_mof.sql
|
└── data
    ├── raw                : Source data, input for mapping script
    └── processed          : Darwin Core output of mapping script GENERATED
```

## Installation

1. Clone this repository to your computer
2. Open the RStudio project file
3. Open the `dwc_mapping.Rmd` [R Markdown file](https://rmarkdown.rstudio.com/) in RStudio
4. Install any required packages
5. Click `Run > Run All` to generate the processed data

## License

[MIT License](LICENSE) for the code and documentation in this repository. The included data is released under another license.
