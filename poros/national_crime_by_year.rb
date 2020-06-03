class NationalCrimesByYear
  attr_reader :arson,
              :homicide,
              :aggravated_assault,
              :property_crime

  def initialize(crime_info)
    @crime_info = crime_info
    @arson = crime_info[:arson]
    @homicide = crime_info[:homicide]
    @aggravated_assault = crime_info[:aggravated_assault]
    @property_crime = crime_info[:property_crime]
  end

  def rape
    return @crime_info[:rape_revised] unless @crime_info[:rape_revised].nil?
    @crime_info[:rape_legacy]
  end
end
