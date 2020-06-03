require 'pry'
require './poros/state_crimes_by_year'

class StateStats
  attr_reader :crime_total,
              :arson_total,
              :homicide_total,
              :rape_total,
              :aggravated_assault_total,
              :property_crime_total
  
  def initialize(state)
    # @crime_total = 
    # @arson_total = placeholder[:arson]
    # @homicide_total = placeholder[:homicide]
    # @rape_total = placeholder[:rape_revised]
    # @aggravated_assault_total = placeholder[:aggravated_assault]
    # @property_crime_total = placeholder[:property_crime]
    @collection = objects(state)
  end

  def objects(state)
    last_ten_years(state).map do |result|
      StateCrimesByYear.new(result)
    end
  end

  def last_ten_years(state)
    this_year = Time.now.year
    api_results(state).find_all do |result|
      ((this_year - 10)..this_year).include?(result[:year])
    end
  end

  def api_results(state)
    FBIService.new.crimes_for(state)
  end
end
