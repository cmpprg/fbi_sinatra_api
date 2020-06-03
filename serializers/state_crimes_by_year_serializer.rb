require 'fast_jsonapi'

class StateCrimesByYearSerializer
  include FastJsonapi::ObjectSerializer

  attributes :rape,
             :property_crime,
             :homicide,
             :arson,
             :aggravated_assault

  set_id :year

end
