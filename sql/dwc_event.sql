/*
Created by Damiano Oldoni (INBO)
*/

SELECT
-- RECORD-LEVEL
  'Event'                               AS type,
  'en'                                  AS language,
  'https://creativecommons.org/licenses/by-nc/4.0/legalcode' AS license,
  'PCM'                                 AS rightsHolder,
  ''                                    AS datasetID,
  'PCM'                                 AS institutionCode,
  'Monitoring of fishes and crustacea by the Provincial Center of Environmental Research (PCM) in East Flanders, Belgium' AS datasetName,
  'HumanObservation'                    AS basisOfRecord,
  o."SamplingProtocol"                  AS samplingProtocol, -- targeted monitoring
-- EVENT
  o."ObservationIdentifier"             AS eventID,
  date(o."DateOfObservation")           AS eventDate,
-- LOCATION
  'Europe'                              AS continent,
  'BE'                                  AS countryCode,
  o."Waterbody"                         AS waterBody,
  'East Flanders'                       AS stateProvince,
  o."Location"                          AS locationRemarks,
  printf('%.5f', ROUND(o."Y", 5))       AS decimalLatitude,
  printf('%.5f', ROUND(o."X", 5))       AS decimalLongitude,
  'WGS84'                               AS geodeticDatum,
  CASE
    WHEN o."CoordinateUncertainty" IS NULL THEN 30
    WHEN o."CoordinateUncertainty" = 0 THEN 30
    ELSE o."CoordinateUncertainty"
  END                                   AS coordinateUncertaintyInMeters,
  o."YCoordinaat"                       AS verbatimLatitude,
  o."XCoordinaat"                       AS verbatimLongitude,
  'EPSG:31370'                          AS verbatimSRS
  FROM occurrences AS o
