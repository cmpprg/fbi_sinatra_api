require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'

    require 'pry'; binding.pry

    expect(last_response).to be_ok
  end
end
