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

#if debug == true
    #puts "Debug Weather Test: #{@forecast["current"]["weather"][0]["description"]}"
#end


#puts "Hourly Temperatures and Wind Speeds:"

#hour_number=1
#for hour in @forecast["hourly"]
    #if hour_number==1
        #puts "In an hour, it will be #{hour["temp"]} degrees with #{hour["wind_speed"]} mph wind."
    #elsif hour_number>1 && hour_number<8
        #puts "In #{hour_number} hours, it will be #{hour["temp"]} degrees with #{hour["wind_speed"]} mph wind."
    #else
        #uts "We are having trouble retrieving the hourly forecast. Please check back later!"
    #end
#break if hour_number==7
#hour_number=hour_number+1
#end

#NEWS

search_section = "everything"
search_term = "golf"
news_key = "cd981733a89642dcbe51e7d8eee39da9"
#Sorry, I hope it's ok that I decided against going with the top headlines and, instead, decided to query within the "everything" section. I wanted the news results to make sense given the intent of the provided weather information.
news_url = "https://newsapi.org/v2/#{search_section}?q=#{search_term}&apiKey=#{news_key}"
@news = HTTParty.get(news_url).parsed_response.to_hash

#if debug == true
    #puts "Debug News Test: #{@news["articles"][0]["title"]}"
#end

#story_number = 0
    #or story in @news["articles"]
        #puts "Article Title: #{@news["articles"][story_number]["title"]}"
        ##@link = story[story_number]["url"]
        ##@image = story[story_number]["urlToImage"]
    #break if story_number == 4
    #story_number = story_number+1
#end
