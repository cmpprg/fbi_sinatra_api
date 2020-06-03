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
end
