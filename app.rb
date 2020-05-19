debug = false

require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do

#WEATHER

lat = 40.582305
long = -80.170219
units = "imperial"
key = "e2287273035896a82b22c35ccc9b94ff"
url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"

@forecast = HTTParty.get(url).parsed_response.to_hash
    
view 'news'

end
  


if debug == true
    puts "Debug Weather Test: #{@forecast["current"]["weather"][0]["description"]}"
end

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

puts "Hourly Temperatures and Wind Speeds:"

hour_number=1
for hour in @forecast["hourly"]
    if hour_number==1
        puts "In an hour, it will be #{hour["temp"]} degrees with #{hour["wind_speed"]} mph wind."
    elsif hour_number>1 && hour_number<8
        puts "In #{hour_number} hours, it will be #{hour["temp"]} degrees with #{hour["wind_speed"]} mph wind."
    else
        puts "We are having trouble retrieving the hourly forecast. Please check back later!"
    end
break if hour_number==7
hour_number=hour_number+1
end

#NEWS

search_section = "everything"
search_term = "golf"
news_key = "cd981733a89642dcbe51e7d8eee39da9"
#Sorry, I hope it's ok that I decided against going with the top headlines and, instead, decided to query within the "everything" section. I wanted the news results to make sense given the intent of the provided weather information.
news_url = "https://newsapi.org/v2/#{search_section}?q=#{search_term}&apiKey=#{news_key}"
@news = HTTParty.get(news_url).parsed_response.to_hash

if debug == true
    puts "Debug News Test: #{@news["articles"][0]["title"]}"
end

story_number = 0
    for story in @news["articles"]
        puts "Article Title: #{@news["articles"][story_number]["title"]}"
        #@link = story[story_number]["url"]
        #@image = story[story_number]["urlToImage"]
    break if story_number == 4
    story_number = story_number+1
end
