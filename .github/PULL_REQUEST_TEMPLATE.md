## Brief description

This is an **automatically generated PR**. 
The following steps are all automatically performed:

- Fetch raw data
- Map raw data to DwC standard and save the output in `./data/processed`
- Get an overview of the changes
- Run some tests, e.g. check the uniqueness of `occurrenceID`, check that all occurrences have a `eventID` and `scientificName`, check that `samplingProtocol` and `individualCount` are correctly set.

Note to the reviewer: the workflow automation is still in a development phase. Please, check the output thoroughly before merging to `main`. In case, improve the data fecthing  `fetch_data.Rmd`, the  mapping `dwc_mapping.Rmd`, both in  `./src` or  the GitHub workflows  `fetch-data.yaml` and  `mapping_and_testing.yaml` in `./.github/workflows`.
