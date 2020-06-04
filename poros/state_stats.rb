require './poros/national_stats'
require './poros/state_crimes_by_year'

class StateStats
  attr_reader :state

  def initialize(state)
    @state = state
    @state_collection ||= objects(state)
    @national_stats = NationalStats.new
  end

  def arson_total
    Calculable.sum_of_attribute(@state_collection, 'arson')
  end

  def homicide_total
    Calculable.sum_of_attribute(@state_collection, 'homicide')
  end

  def rape_total
    Calculable.sum_of_attribute(@state_collection, 'rape')
  end

  def aggravated_assault_total
    Calculable.sum_of_attribute(@state_collection, 'aggravated_assault')
  end

  def property_crime_total
    Calculable.sum_of_attribute(@state_collection, 'property_crime')
  end

  def arson_percent_state
    Calculable.percent(arson_total, grand_total_crime)
  end

  def homicide_percent_state
    Calculable.percent(homicide_total, grand_total_crime)
  end

  def rape_percent_state
    Calculable.percent(rape_total, grand_total_crime)
  end

  def aggravated_assault_percent_state
    Calculable.percent(aggravated_assault_total, grand_total_crime)
  end

  def property_crime_percent_state
    Calculable.percent(property_crime_total, grand_total_crime)
  end

  def arson_percent_national
    Calculable.percent(arson_total, @national_stats.arson_total)
  end

  def homicide_percent_national
    Calculable.percent(homicide_total, @national_stats.homicide_total)
  end

  def rape_percent_national
    Calculable.percent(rape_total, @national_stats.rape_total)
  end

  def aggravated_assault_percent_national
    Calculable.percent(aggravated_assault_total, @national_stats.aggravated_assault_total)
  end

  def property_crime_percent_national
    Calculable.percent(property_crime_total, @national_stats.property_crime_total)
  end

  private

  def objects(state)
    last_ten_years(state).map do |result|
      StateCrimesByYear.new(result)
    end
  end

  def last_ten_years(state)
    Calculable.last_ten_years(api_results(state), :year)
  end

  def api_results(state)
    FBIService.new.crimes_for(state)
  end

  def grand_total_crime
    Calculable.sum_of_attribute(@state_collection, 'total_crime')
  end
end
