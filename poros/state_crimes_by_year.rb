class StateCrimesByYear
  attr_reader :year,
              :arson,
              :homicide,
              :rape,
              :aggravated_assault,
              :property_crime

  def initialize(crime_results)
    @year = crime_results[:year]
    @arson = crime_results[:arson]
    @homicide = crime_results[:homicide]
    @rape = crime_results[:rape_revised]
    @aggravated_assault = crime_results[:aggravated_assault]
    @property_crime = crime_results[:property_crime]
  end

end
