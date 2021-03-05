library HIVSimpleAgeGroup version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AgeRanges called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

context Patient

define "Sex":
  Patient.gender

define "Age Group/Sex":
  AR."Age Group".code + ':' + "Sex"

// error: could not resolve call to operator add with signature string.system.boolean
/* define "Age Group/Sex/Is HIV Positive":
  AR."Age Group".code + ':' + "Sex" + ':' + "Is HIV Positive" */

/* define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive"
    when "Is HIV Negative" then "HIV Negative"
    else null
  end

define "Age Group/Sex/HIV Test Results":
  AR."Age Group".code + ':' + "Sex" + ':' + "HIV Test Results".code */

define "Initial Population": true

define "Denominator": true

define "Numerator":
  "Sex" = 'female'
