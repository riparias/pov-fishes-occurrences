/*
Created by Damiano Oldoni (INBO)
*/

/* sampling effort */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'sampling duration'                   AS measurementType,
  printf('%.2f', ROUND(o."LengthOfTime_Min", 2)) AS measurementValue,
  'minute'                              AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."LengthOfTime_Min" AS NUMERIC) > 0

UNION

/* survey transect length */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'sampling distance'                   AS measurementType,
  printf('%.1f', ROUND(o."LengthOfLocation_Meter", 1)) AS measurementValue,
  'meter'                              AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."LengthOfLocation_Meter" AS NUMERIC) > 0

UNION

/* length */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'length'                              AS measurementType,
  printf('%.1f', ROUND(o."LengtSpecimen_Cm", 1)) AS measurementValue,
  'cm'                                  AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."LengtSpecimen_Cm" AS NUMERIC) > 0

UNION

/* weight */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'weight'                              AS measurementType,
  printf('%.2f', ROUND(o."WeightSpecimen_Gram", 2)) AS measurementValue,
  'g'                                   AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."WeightSpecimen_Gram" AS NUMERIC) > 0

UNION

/* pH */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'pH'                                  AS measurementType,
  printf('%.1f', ROUND(o."pH", 2))      AS measurementValue, -- pH has 2 decimals precision
  NULL                                  AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."pH" AS NUMERIC) > 0

UNION

/* dissolved oxygen */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'dissolved oxygen'                    AS measurementType,
  printf('%.1f', ROUND(o."Oxygen_MgPerL", 1)) AS measurementValue,
  'mg/L'                                AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."Oxygen_MgPerL" AS NUMERIC) > 0

UNION

/* oxygen saturation */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'oxygen saturation'                   AS measurementType,
  printf('%.1f', ROUND(o."Oxygen_PercentSaturation", 1)) AS measurementValue,
  '%'                                   AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."Oxygen_PercentSaturation" AS NUMERIC) > 0

UNION

/* electrical conductivity */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'electrical conductivity'             AS measurementType,
  printf('%.1f', ROUND(o."Conductivity_MicroSPerCm", 1)) AS measurementValue,
  'µS/cm'                               AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."Conductivity_MicroSPerCm" AS NUMERIC) > 50 -- value 8 is a measurement error

UNION

/* temperature */

SELECT
  o."ObservationIdentifier"             AS eventID,
  'temperature'                         AS measurementType,
  printf('%.1f', ROUND(o."Temperature_Celsius", 1)) AS measurementValue,
  '°C'                                AS measurementUnit
FROM occurrences AS o
WHERE CAST(o."Temperature_Celsius" AS NUMERIC) > 0
