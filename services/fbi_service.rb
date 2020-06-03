class FBIService
  def crimes_for(state)
    key = ENV['FBI_KEY']
    response = Faraday.get("https://api.usa.gov/crime/fbi/sapi/api/estimates/states/#{state}/2010/2020?API_KEY=#{key}")
    json = JSON.parse(response.body, symbolize_names: true)
    results = json[:results]
  end
end
