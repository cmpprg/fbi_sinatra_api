require File.expand_path '../../spec_helper.rb', __FILE__

RSpec.describe 'FBI API V1' do
  it 'can gather state data and respond with json' do
    get '/api/v1/crimes/states?state=CO'

    expect(last_response).to be_successful

    json = JSON.parse(last_response.body, symbolize_names: true)

    expect(json[:data]).to be_instance_of(Hash)
    expect(json[:data][:id]).to eql('CO')
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

  it "can gather national data and return it as json" do
    get '/api/v1/crimes/national'

    expect(last_response).to be_successful

    json = JSON.parse(last_response.body, symbolize_names: true)

    require 'pry'; binding.pry
    expect(json[:data]).to be_instance_of(Hash)
    expect(json[:data][:id]).to eql('US')
    expect(json[:data][:attributes]).to_not be_empty
    expect(json[:data][:attributes]).to have_key(:rape_total)
    expect(json[:data][:attributes]).to have_key(:property_crime_total)
    expect(json[:data][:attributes]).to have_key(:homicide_total)
    expect(json[:data][:attributes]).to have_key(:arson_total)
    expect(json[:data][:attributes]).to have_key(:aggravated_assault_total)

    expect(json[:data][:attributes]).to have_key(:rape_percent_of_total)
    expect(json[:data][:attributes]).to have_key(:property_crime_percent_of_total)
    expect(json[:data][:attributes]).to have_key(:homicide_percent_of_total)
    expect(json[:data][:attributes]).to have_key(:arson_percent_of_total)
    expect(json[:data][:attributes]).to have_key(:aggravated_assault_percent_of_total)

  end
end
