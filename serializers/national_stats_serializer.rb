require 'fast_jsonapi'

class NationalStatsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :rape_total,
             :property_crime_total,
             :homicide_total,
             :arson_total,
             :aggravated_assault_total,
             :rape_percent_of_total,
             :property_crime_percent_of_total,
             :homicide_percent_of_total,
             :arson_percent_of_total,
             :aggravated_assault_percent_of_total

  set_id { |id| id = "US" }
end
