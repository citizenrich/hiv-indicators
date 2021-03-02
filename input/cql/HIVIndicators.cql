library HIVIndicators version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// HIV Test Results
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'

context Patient

define "HIV Positive Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] O
    where O.value ~ "HIV Positive"

define "HIV Negative Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] O
    where O.value ~ "HIV Negative"

define "Is HIV Positive":
  exists ("HIV Positive Observation")

define "Is HIV Negative":
  exists ("HIV Negative Observation")

define "Sex": Patient.gender

// HIV Test Results
/* define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive"
    when "Is HIV Negative" then "HIV Negative"
    else null
  end */
