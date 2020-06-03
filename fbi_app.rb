require 'sinatra'
require 'faraday'
require 'sinatra/json'
require './poros/state_crimes_by_year'
require './serializers/state_crimes_by_year_serializer'

get '/' do
  'Hello world!'
end

get '/api/v1/crimes' do
  key = ENV["FBI_KEY"]
  state = params['state']

  #service start

  # service -> ----Collection---- -> single_objects = each_hash
  response = Faraday.get("https://api.usa.gov/crime/fbi/sapi/api/estimates/states/#{state}/2010/2020?API_KEY=#{key}")
  json = JSON.parse(response.body, symbolize_names: true)
  results = json[:results]

  this_year = Time.now.year

  last_ten_years = results.find_all do |result|
    ((this_year - 10)..this_year).include?(result[:year])
  end
  # service end

  crime_objects = last_ten_years.map do |result|
    StateCrimesByYear.new(result)
  end

  json StateCrimesByYearSerializer.new(crime_objects)

end
