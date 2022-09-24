/*
Created by Damiano Oldoni (INBO)
*/

/* length */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'length'                              AS measurementType,
  o."LengtSpecimen_Cm"                  AS measurementValue,
  'cm'                                  AS measurementUnit
FROM occurrences AS o
WHERE o."LengtSpecimen_Cm" > 0

UNION

/* weight */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'weight'                              AS measurementType,
  o."WeightSpecimen_Gram"               AS measurementValue,
  'g'                                   AS measurementUnit
FROM occurrences AS o
WHERE o."WeightSpecimen_Gram" > 0

UNION

/* pH */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'pH'                                  AS measurementType,
  o."pH"                                AS measurementValue,
  NULL                                  AS measurementUnit
FROM occurrences AS o
WHERE o."pH" > 0

UNION

/* dissolved oxygen */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'dissolved oxygen'                    AS measurementType,
  o."Oxygen_MgPerL"                     AS measurementValue,
  'mg/L'                                AS measurementUnit
FROM occurrences AS o
WHERE o."Oxygen_MgPerL" > 0

UNION

/* oxygen saturation */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'oxygen saturation'                   AS measurementType,
  o."Oxygen_PercentSaturation"          AS measurementValue,
  '%'                                   AS measurementUnit
FROM occurrences AS o
WHERE o."Oxygen_PercentSaturation" > 0

UNION

/* electrical conductivity */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'electrical conductivity'             AS measurementType,
  o."Conductivity_MicroSPerCm"          AS measurementValue,
  'µS/cm'                               AS measurementUnit
FROM occurrences AS o
WHERE o."Conductivity_MicroSPerCm" > 50 -- value 8 is a measurement error

UNION

/* temperature */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'temperature'                         AS measurementType,
  o."Temperature_Celsius"               AS measurementValue,
  '°C'                                AS measurementUnit
FROM occurrences AS o
WHERE o."Temperature_Celsius" > 0
