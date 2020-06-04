require './services/fbi_service'
require './poros/national_crime_by_year'
require './modules/calculable'

class NationalStats
  include Calculable
  def initialize
    @national_collection = objects
  end

  def arson_total
    Calculable.sum_of_attribute(@national_collection, 'arson')
  end

  def homicide_total
    Calculable.sum_of_attribute(@national_collection, 'homicide')
  end

  def rape_total
    Calculable.sum_of_attribute(@national_collection, 'rape')
  end

  def aggravated_assault_total
    Calculable.sum_of_attribute(@national_collection, 'aggravated_assault')
  end

  def property_crime_total
    Calculable.sum_of_attribute(@national_collection, 'property_crime')
  end

  def rape_percent_of_total
    Calculable.percent(rape_total, grand_total_crime)
  end

  def property_crime_percent_of_total
    Calculable.percent(property_crime_total, grand_total_crime)
  end

  def homicide_percent_of_total
    Calculable.percent(homicide_total, grand_total_crime)
  end

  def arson_percent_of_total
    Calculable.percent(arson_total, grand_total_crime)
  end

  def aggravated_assault_percent_of_total
    Calculable.percent(aggravated_assault_total, grand_total_crime)
  end

  private

  def objects
    last_ten_years.map do |result|
      NationalCrimesByYear.new(result)
    end
  end

  def last_ten_years
    Calculable.last_ten_years(api_results, :year)
  end

  def api_results
    FBIService.new.national_crimes
  end

  def grand_total_crime
    Calculable.sum_of_attribute(@national_collection, 'total_crime')
  end
end
