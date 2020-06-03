class FBIService
  def crimes_for(state)
    hashed_json(state)[:results]
  end

  private

  def base_url
    'https://api.usa.gov/crime/fbi/sapi'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['API_KEY'] = ENV['FBI_KEY']
    end
  end

  def state_response(state)
    connect.get("api/estimates/states/#{state}/#{this_year - 10}/#{this_year}")
  end

  def hashed_json(state)
    JSON.parse(state_response(state).body, symbolize_names: true)
  end

  def this_year
    Time.now.year
  end
end
