require 'fast_jsonapi'

class StateStatsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :arson_total,
             :homicide_total,
             :rape_total,
             :aggravated_assault_total,
             :property_crime_total,
             :arson_percent_state,
             :homicide_percent_state,
             :rape_percent_state,
             :aggravated_assault_percent_state,
             :property_crime_percent_state,
             :arson_percent_national,
             :homicide_percent_national,
             :rape_percent_national,
             :aggravated_assault_percent_national,
             :property_crime_percent_national

  set_id :state
end
