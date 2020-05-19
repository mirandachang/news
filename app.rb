require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 42.0574063
  long = -87.6722787

  units = "imperial" # or metric, whatever you like
  key = "YOUR-API-KEY-GOES-HERE" # replace this with your real OpenWeather API key

  # construct the URL to get the API data (https://openweathermap.org/api/one-call-api)
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=40.582305&lon=-80.170219&units=imperial&appid=e2287273035896a82b22c35ccc9b94ff"

  # make the call
  @forecast = HTTParty.get(url).parsed_response.to_hash

  ### Get the news
end
