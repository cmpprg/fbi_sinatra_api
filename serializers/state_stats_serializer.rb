require 'fast_jsonapi'

class StateStatsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :arson_total,
             :homicide_total,
             :rape_total,
             :aggravated_assault_total,
             :property_crime_total

  set_id nil
end
