# load packages
library(here)
library(readr)
library(testthat)

# read proposed new version of the DwC mapping
event_path <- here::here("data", "processed", "event.csv")
dwc_event <- readr::read_csv(event_path, guess_max = 10000)
occ_path <- here::here("data", "processed", "occurrence.csv")
dwc_occurrence <- readr::read_csv(occ_path, guess_max = 10000)
mof_path <- here::here("data", "processed", "mof.csv")
dwc_mof <- readr::read_csv(mof_path, guess_max = 10000)

# test event core
testthat::test_that("Right columns in right order: event core", {
  columns_event <- c(
    "type",
    "language",
    "license",
    "rightsHolder",
    "datasetID",
    "institutionCode",
    "datasetName",
    "samplingProtocol",
    "eventID",
    "eventDate",
    "continent",
    "countryCode",
    "stateProvince",
    "locationRemarks",
    "decimalLatitude",
    "decimalLongitude",
    "geodeticDatum",
    "coordinateUncertaintyInMeters",
    "verbatimLatitude",
    "verbatimLongitude",
    "verbatimSRS"
  )
  testthat::expect_equal(names(dwc_event), columns_event)
})

testthat::test_that("eventID is always present and is unique", {
  testthat::expect_true(all(!is.na(dwc_event$eventID)))
  testthat::expect_equal(length(unique(dwc_event$eventID)),
                         nrow(dwc_event))
})

testthat::test_that("eventDate is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$eventDate)))
})

testthat::test_that("samplingProtocol is always equal to targeted monitoring", {
  testthat::expect_true(all(!is.na(dwc_event$samplingProtocol)))
  testthat::expect_equal(
    unique(dwc_event$samplingProtocol), "targeted monitoring"
  )
})

testthat::test_that("decimalLatitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$decimalLatitude)))
})

testthat::test_that("decimalLatitude is within Flemish boundaries", {
  testthat::expect_true(all(dwc_event$decimalLatitude < 51.65))
  testthat::expect_true(all(dwc_event$decimalLatitude > 50.63))
})

testthat::test_that("decimalLongitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$decimalLongitude)))
})

testthat::test_that("decimalLongitude is within Flemish boundaries", {
  testthat::expect_true(all(dwc_event$decimalLongitude < 5.95))
  testthat::expect_true(all(dwc_event$decimalLongitude > 2.450))
})

testthat::test_that("coordinateUncertainty is always present and positive", {
  testthat::expect_true(all(!is.na(dwc_event$coordinateUncertaintyInMeters)))
  testthat::expect_true(all(as.numeric(dwc_event$coordinateUncertaintyInMeters) > 0))
})

testthat::test_that("verbatimLatitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$verbatimLatitude)))
})

testthat::test_that("verbatimLongitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$verbatimLongitude)))
})

testthat::test_that("verbatim coordinates are always positive", {
  # verbatimLatitude
  testthat::expect_true(all(dwc_event$verbatimLatitude > 0))
  # verbatimLongitude
  testthat::expect_true(all(dwc_event$verbatimLongitude > 0))
})

testthat::test_that("countryCode is always present and always equal to BE", {
  # no NAs present
  testthat::expect_true(all(!is.na(dwc_event$countryCode)))
  # all events have countryCode = "BE"
  testthat::expect_true(all(dwc_event$countryCode == "BE"))
})

# occurrence extension

testthat::test_that("Right columns in right order: occurrence extension", {
  columns_occurrence <- c(
    "eventID",
    "basisOfRecord",
    "occurrenceID",
    "individualCount",
    "identificationVerificationStatus",
    "scientificName",
    "kingdom",
    "vernacularName"
  )
  testthat::expect_equal(names(dwc_occurrence), columns_occurrence)
})

testthat::test_that("occurrenceID is always present and is unique", {
  testthat::expect_true(all(!is.na(dwc_occurrence$occurrenceID)))
  testthat::expect_equal(length(unique(dwc_occurrence$occurrenceID)),
                         nrow(dwc_occurrence))
})

testthat::test_that("all eventID values are in occurrenceID and viceversa", {
  testthat::expect_true(
    all(dwc_event$eventID %in% dwc_occurrence$occurrenceID)
  )
  testthat::expect_true(
    all(dwc_occurrence$occurrenceID %in% dwc_event$eventID)
  )
})

testthat::test_that(
  "identificationVerificationStatus is always equal to verified by experts", {
    testthat::expect_true(
      all(dwc_occurrence$identificationVerificationStatus == "verified by experts")
    )
})

testthat::test_that("basisOfRecord is always HumanObservation", {
  testthat::expect_equal(
    unique(dwc_occurrence$basisOfRecord), "HumanObservation"
  )
})

testthat::test_that(
  "individualCount is always an integer greater than 0", {
    testthat::expect_true(all(as.integer(dwc_occurrence$individualCount) > 0))
})

testthat::test_that("scientificName is never NA and one of the list", {
  species <- c(
    "Abramis brama",
    "Alburnus alburnus",
    "Ameiurus nebulosus",
    "Anarhichas lupus",
    "Aspius aspius",
    "Barbatula barbatulus",
    "Blicca bjoerkna",
    "Carassius auratus auratus",
    "Carassius auratus gibelio",
    "Carassius carassius",
    "Chelon ramada",
    "Ctenopharyngodon idella",
    "Cyprinus carpio",
    "Dicentrarchus labrax",
    "Eriocheir sinensis",
    "Esox lucius",
    "Faxonius limosus",
    "Gasterosteus aculeatus",
    "Gobio gobio",
    "Gymnocephalus cernua",
    "Hypophthalmichthys molitrix",
    "Lepomis gibbosus",
    "Leucaspius delineatus",
    "Leuciscus idus",
    "Leuciscus leuciscus",
    "Leuciscus rutilus",
    "Lithobates catesbeianus",
    "Neogobius melanostomus",
    "Oncorhynchus mykiss",
    "Osmerus eperlanus",
    "Perca fluviatilis",
    "Pimephales promelas",
    "Platichthys flesus",
    "Pleuronectes platessa",
    "Pomatoschistus microps",
    "Pomatoschistus minutus",
    "Procambarus clarkii",
    "Pseudorasbora parva",
    "Pungitius pungitius",
    "Rhodeus sericeus",
    "Rutilus erythrophthalmus",
    "Rutilus rutilus",
    "Scardinius erythrophthalmus",
    "Solea solea",
    "Sprattus sprattus",
    "Squalius cephalus",
    "Stizostedion lucioperca",
    "Stizostedion lucoperca",
    "Tinca tinca",
    "Trisopterus luscus",
    "Umbra pygmaea"
  )
  testthat::expect_true(all(!is.na(dwc_occurrence$scientificName)))
  testthat::expect_true(all(dwc_occurrence$scientificName %in% species))
})

testthat::test_that("kingdom is always equal to Animalia", {
  testthat::expect_true(all(!is.na(dwc_occurrence$kingdom)))
  testthat::expect_true(all(dwc_occurrence$kingdom == "Animalia"))
})

testthat::test_that(
  "vernacularName is never NA and one of the list", {
    vernacular_names <- c(
      "alver",
      "Amerikaanse hondsvis",
      "Amerikaanse stierkikker",
      "baars",
      "bermpje",
      "bittervoorn",
      "blankvoorn",
      "blauwbandgrondel",
      "bot",
      "brakwatergrondel",
      "brasem",
      "bruine Amerikaanse dwergmeerval",
      "Chinese wolhandkrab",
      "dikkopelrits",
      "dikkopje",
      "driedoornige stekelbaars",
      "dunlipharder",
      "Europese meerval",
      "gevlekte Amerikaanse rivierkreeft",
      "giebel",
      "goudvis",
      "graskarper",
      "karper",
      "kolblei",
      "kopvoorn",
      "kroeskarper",
      "pos",
      "regenboogforel",
      "rietvoorn",
      "riviergrondel",
      "rode Amerikaanse rivierkreeft",
      "roofblei",
      "schol",
      "serpeling",
      "snoekbaars",
      "snoek",
      "spiering",
      "sprot",
      "steenbolk",
      "tiendoornige stekelbaars",
      "tong",
      "vetje",
      "winde",
      "zeebaars",
      "zeelt",
      "zeewolf",
      "zilverkarper",
      "zonnebaars",
      "zwartbekgrondel"
    )
    testthat::expect_true(
      all(!is.na(dwc_occurrence$vernacularName))
    )
    testthat::expect_true(
      all(dwc_occurrence$vernacularName %in% vernacular_names)
    )
})

# mof extension

testthat::test_that("Right columns in right order: mof extension", {
  columns_mof <- c(
    "eventID",
    "measurementType",
    "measurementValue",
    "measurementUnit"
  )
  testthat::expect_equal(names(dwc_mof), columns_mof)
})

testthat::test_that("eventID is always present and is unique", {
  testthat::expect_true(all(!is.na(dwc_mof$eventID)))
})

testthat::test_that("all eventID values are in event core but not viceversa", {
  testthat::expect_true(
    all(dwc_mof$eventID %in% dwc_event$eventID)
  )
  testthat::expect_false(
    all(dwc_event$eventID %in% dwc_mof$eventID)
  )
})

testthat::test_that("measurementType always filled in and one of the list", {
  types <- c(
    "dissolved oxygen",
    "electrical conductivity",
    "length",
    "oxygen saturation",
    "pH",
    "sampling distance",
    "sampling duration",
    "temperature",
    "weight"
  )
  testthat::expect_true(all(!is.na(dwc_mof$measurementType)))
  testthat::expect_equal(sort(unique(dwc_mof$measurementType)), types)
})

testthat::test_that("measurementValue always filled in and positive", {
  testthat::expect_true(all(!is.na(dwc_mof$measurementValue)))
  testthat::expect_true(all(as.numeric(dwc_mof$measurementValue) > 0))
})

testthat::test_that(
  "measurementUnit always filled in except for pH and one of the list", {
    units_mof <- c("%", "°C", "µS/cm", "cm", "g", "meter","mg/L", "minute")
    testthat::expect_true(
      all(!is.na(dwc_mof[dwc_mof$measurementType !="pH",]$measurementUnit))
    )
    testthat::expect_true(
      all(sort(
        unique(dwc_mof[dwc_mof$measurementType !="pH",]$measurementUnit),
        na.last = NA
        ) %in% units_mof
      )
    )
  }
)

testthat::test_that(
  "sampling distance is expressed in meters", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "sampling distance",]$measurementUnit) == "meter"
    )
  }
)

testthat::test_that(
  "length is expressed in centimeters", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "length",]$measurementUnit) == "cm"
    )
  }
)

testthat::test_that(
  "weight is expressed in grams", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "weight",]$measurementUnit) == "g"
    )
  }
)

testthat::test_that(
  "pH is adimensional", {
    testthat::expect_true(
      is.na(unique(dwc_mof[dwc_mof$measurementType == "pH",]$measurementUnit))
    )
  }
)

testthat::test_that(
  "dissolved oxygen is expressed in percentage", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "dissolved oxygen",]$measurementUnit) == "mg/L"
    )
  }
)

testthat::test_that(
  "dissolved oxygen is expressed in mg/L", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "dissolved oxygen",]$measurementUnit) == "mg/L"
    )
  }
)

testthat::test_that(
  "oxygen saturation is expressed in percentage", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "oxygen saturation",]$measurementUnit) == "%"
    )
  }
)

testthat::test_that(
  "electrical conductivity is expressed in uS/cm", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "electrical conductivity",]$measurementUnit) == "µS/cm"
    )
  }
)

testthat::test_that(
  "temperature is expressed in Celsius degrees", {
    testthat::expect_true(
      unique(dwc_mof[dwc_mof$measurementType == "temperature",]$measurementUnit) == "°C"
    )
  }
)
