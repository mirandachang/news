#require "sinatra"
#require "sinatra/reloader"
require "httparty"
#def view(template); erb template.to_sym; end

#get "/" do
  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 40.582305
  long = -80.170219
  units = "imperial"
  key = "e2287273035896a82b22c35ccc9b94ff"
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=40.582305&lon=-80.170219&units=imperial&appid=e2287273035896a82b22c35ccc9b94ff"

 @forecast = HTTParty.get(url).parsed_response.to_hash

puts "Right now, it is #{@forecast["current"]["temp"]} degrees at Sewickley Heights Golf Club, with #{@forecast["current"]["wind_speed"]} mph wind from the"

if @forecast["current"]["wind_speed"] < 11.25
    puts "north."
elsif @forecast["current"]["wind_speed"] >=348.75 && @forecast["current"]["wind_speed"] <=360
    puts "north."
elsif @forecast["current"]["wind_speed"] >= 11.25 && @forecast["current"]["wind_speed"] <33.75
    puts "north-northeast."
elsif @forecast["current"]["wind_speed"] >= 33.75 && @forecast["current"]["wind_speed"] <56.25
    puts "northeast."
elsif @forecast["current"]["wind_speed"] >= 56.25 && @forecast["current"]["wind_speed"] <78.75
    puts "east-northeast."
elsif @forecast["current"]["wind_speed"] >= 78.75 && @forecast["current"]["wind_speed"] <101.25
    puts "east."
elsif @forecast["current"]["wind_speed"] >= 101.25 && @forecast["current"]["wind_speed"] <123.75
    puts "east-southeast."
elsif @forecast["current"]["wind_speed"] >= 123.75 && @forecast["current"]["wind_speed"] <146.25
    puts "southeast."
elsif @forecast["current"]["wind_speed"] >= 146.25 && @forecast["current"]["wind_speed"] <168.75
    puts "south-southeast."
elsif @forecast["current"]["wind_speed"] >= 168.75 && @forecast["current"]["wind_speed"] <191.25
    puts "south."
elsif @forecast["current"]["wind_speed"] >= 191.25 && @forecast["current"]["wind_speed"] <213.75
    puts "south-southwest."
elsif @forecast["current"]["wind_speed"] >= 213.75 && @forecast["current"]["wind_speed"] <236.25
    puts "southwest."
elsif @forecast["current"]["wind_speed"] >= 236.25 && @forecast["current"]["wind_speed"] <258.75
    puts "west-southwest."
elsif @forecast["current"]["wind_speed"] >= 258.75 && @forecast["current"]["wind_speed"] <281.25
    puts "west."
elsif @forecast["current"]["wind_speed"] >= 281.25 && @forecast["current"]["wind_speed"] <303.75
    puts "west-northwest."
elsif @forecast["current"]["wind_speed"] >= 303.75 && @forecast["current"]["wind_speed"] <326.25
    puts "northwest."
elsif @forecast["current"]["wind_speed"] >= 326.25 && @forecast["current"]["wind_speed"] <348.75
    puts "north-northwest."
else
    puts "unknown direction."
end



#end
