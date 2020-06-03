require File.expand_path '../../spec_helper.rb', __FILE__

RSpec.describe 'FBI API V1' do
  it 'can gather state data and respond with json' do
    get '/api/v1/crimes?state=CO'

    expect(last_response).to be_successful

    json = JSON.parse(last_response.body, symbolize_names: true)
  
    expect(json[:data]).to be_instance_of(Hash)
    expect(json[:data][:attributes]).to_not be_empty
    expect(json[:data][:attributes]).to have_key(:rape_total)
    expect(json[:data][:attributes]).to have_key(:property_crime_total)
    expect(json[:data][:attributes]).to have_key(:homicide_total)
    expect(json[:data][:attributes]).to have_key(:arson_total)
    expect(json[:data][:attributes]).to have_key(:aggravated_assault_total)
    expect(json[:data][:attributes]).to have_key(:rape_percent_state)
    expect(json[:data][:attributes]).to have_key(:property_crime_percent_state)
    expect(json[:data][:attributes]).to have_key(:homicide_percent_state)
    expect(json[:data][:attributes]).to have_key(:arson_percent_state)
    expect(json[:data][:attributes]).to have_key(:aggravated_assault_percent_state)
    expect(json[:data][:attributes]).to have_key(:rape_percent_national)
    expect(json[:data][:attributes]).to have_key(:property_crime_percent_national)
    expect(json[:data][:attributes]).to have_key(:homicide_percent_national)
    expect(json[:data][:attributes]).to have_key(:arson_percent_national)
    expect(json[:data][:attributes]).to have_key(:aggravated_assault_percent_national)
  end
end
