class StateCrimesByYear
  attr_reader :year,
              :arson,
              :homicide,
              :aggravated_assault,
              :property_crime

  def initialize(crime_results)
    @year = crime_results[:year]
    @arson = crime_results[:arson]
    @homicide = crime_results[:homicide]
    @rape_revised = crime_results[:rape_revised]
    @rape_legacy = crime_results[:rape_legacy]
    @aggravated_assault = crime_results[:aggravated_assault]
    @property_crime = crime_results[:property_crime]
    @crime_results = crime_results
  end

  def rape
    return @rape_revised unless @rape_revised.nil?
    @rape_legacy
  end

  def total_crime
    modified_hash = @crime_results
    modified_hash.delete_if { |key, value| keys_to_delete.include?(key) }
    modified_hash[:rape] = rape
    modified_hash.values.sum
  end

  def keys_to_delete
    [:state_id, :year,:state_abbr, :population, :rape_legacy, :rape_revised]
  end
end
