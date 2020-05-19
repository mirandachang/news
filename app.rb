require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 40.582305
  long = -80.170219
  units = "imperial"
  key = "e2287273035896a82b22c35ccc9b94ff"
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=40.582305&lon=-80.170219&units=imperial&appid=e2287273035896a82b22c35ccc9b94ff"

 @forecast = HTTParty.get(url).parsed_response.to_hash

puts "It is #{forecast["current"]["temp"]} degrees."

for data_point in forecast["current"] 
  puts "Right now, it is #{["temp"]} at Sewickley Heights Golf Club, with #{["wind_speed"]}mph wind."
end

end
