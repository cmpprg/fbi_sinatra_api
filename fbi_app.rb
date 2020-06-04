require './dependency'

get '/' do
  'Hello world!'
end

get '/api/v1/crimes/states' do
  state = StateStats.new(params['state'])
  json StateStatsSerializer.new(state)
end

get '/api/v1/crimes/national' do
  nation = NationalStats.new
  json NationalStatsSerializer.new(nation)
end
