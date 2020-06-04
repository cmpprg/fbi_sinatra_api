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
    @rape_revised = crime_info[:rape_revised]
    @rape_legacy = crime_info[:rape_legacy]
  end

  def rape
    return @rape_revised unless @rape_revised.nil?
    @rape_legacy
  end

  def total_crime
    modified_hash = @crime_info
    modified_hash.delete_if { |key, value| keys_to_delete.include?(key) }
    modified_hash[:rape] = rape
    modified_hash.values.sum
  end

  def keys_to_delete
    [:state_id, :year,:state_abbr, :population, :rape_legacy, :rape_revised]
  end
end
