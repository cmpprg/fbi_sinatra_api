require './poros/national_stats'
require './poros/state_crimes_by_year'

class StateStats
  attr_reader :state

  def initialize(state)
    @state = state
    @collection ||= objects(state)
    @national_stats = NationalStats.new
  end

  def arson_total
    @collection.sum { |crime_for_year| crime_for_year.arson }
  end

  def homicide_total
    @collection.sum { |crime_for_year| crime_for_year.homicide }
  end

  def rape_total
    @collection.sum { |crime_for_year| crime_for_year.rape }
  end

  def aggravated_assault_total
    @collection.sum { |crime_for_year| crime_for_year.aggravated_assault }
  end

  def property_crime_total
    @collection.sum { |crime_for_year| crime_for_year.property_crime }
  end

  def arson_percent_state
    percent = ((arson_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def homicide_percent_state
    percent = ((homicide_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def rape_percent_state
    percent = ((rape_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def aggravated_assault_percent_state
    percent = ((aggravated_assault_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def property_crime_percent_state
    percent = ((property_crime_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

 #national .............
  def arson_percent_national
    percent = ((arson_total / @national_stats.arson_total.to_f) * 100)
    percent.round(1)
  end

  def homicide_percent_national
    percent = ((homicide_total / @national_stats.homicide_total.to_f) * 100)
    percent.round(1)
  end

  def rape_percent_national
    percent = ((rape_total / @national_stats.rape_total.to_f) * 100)
    percent.round(1)
  end

  def aggravated_assault_percent_national
    percent = ((aggravated_assault_total / @national_stats.aggravated_assault_total.to_f) * 100)
    percent.round(1)
  end

  def property_crime_percent_national
    percent = ((property_crime_total / @national_stats.property_crime_total.to_f) * 100)
    percent.round(1)
  end

  private

  def objects(state)
    last_ten_years(state).map do |result|
      StateCrimesByYear.new(result)
    end
  end

  def last_ten_years(state)
    api_results(state).find_all do |result|
      ((this_year - 10)..this_year).include?(result[:year])
    end
  end

  def api_results(state)
    FBIService.new.crimes_for(state)
  end

  def this_year
    Time.now.year
  end

  def grand_total_crime
    @collection.sum { |crime_for_year| crime_for_year.total_crime }
  end
end
