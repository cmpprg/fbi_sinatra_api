require './services/fbi_service'
require './poros/national_crime_by_year'

class NationalStats
  def initialize
    @collection = objects
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

  def rape_percent_of_total
    percent = ((rape_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def property_crime_percent_of_total
    percent = ((property_crime_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def homicide_percent_of_total
    percent = ((homicide_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def arson_percent_of_total
    percent = ((arson_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  def aggravated_assault_percent_of_total
    percent = ((aggravated_assault_total / grand_total_crime.to_f) * 100)
    percent.round(1)
  end

  private

  def objects
    last_ten_years.map do |result|
      NationalCrimesByYear.new(result)
    end
  end

  def last_ten_years
    api_results.find_all do |result|
      ((this_year - 10)..this_year).include?(result[:year])
    end
  end

  def api_results
    FBIService.new.national_crimes
  end

  def this_year
    Time.now.year
  end

  def grand_total_crime
    @collection.sum { |crime_for_year| crime_for_year.total_crime }
  end
end
