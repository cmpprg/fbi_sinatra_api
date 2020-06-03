require File.expand_path '../../spec_helper.rb', __FILE__

RSpec.describe 'FBI API V1' do
  it 'can gather state data and respond with json' do
    get '/api/v1/crimes?state=CO'

    expect(last_response).to be_successful

    json = JSON.parse(last_response.body, symbolize_names: true)

    expect(json[:data]).to be_instance_of(Array)
    expect(json[:data].first[:attributes]).to_not be_empty
    expect(json[:data].first[:attributes]).to have_key(:rape)
    expect(json[:data].first[:attributes]).to have_key(:property_crime)
    expect(json[:data].first[:attributes]).to have_key(:homicide)
    expect(json[:data].first[:attributes]).to have_key(:arson)
    expect(json[:data].first[:attributes]).to have_key(:aggravated_assault)
  end
end
