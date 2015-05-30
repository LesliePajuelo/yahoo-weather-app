require 'yahoo_weatherman'

#translate zip to location
def get_location(zip)
    location = Weatherman::Client.new(:unit =>'f')
    location.lookup_by_location(zip)
end

puts "Please enter the zip code for a 5 day forecast:"
weather = get_location(gets.chomp)

#%w is day of the week with Sunday as 0
today = Time.now.strftime('%w').to_i

#loops through each forecast. The gem limits this to 5 days.
weather.forecasts.each do |forecast|
    day = forecast['date']
    weekday = day.strftime('%w').to_i

    #Assign proper naming convention
    if weekday == today
        name = "Today"

        #accounts for when today is 6
    elsif weekday == today+1 || weekday == today-6
        name = "Tomorrow"
    else
        name = day.strftime('%A')
    end

    puts name + ' is going to be ' + forecast['text'].downcase + ' with a low of ' +
    forecast['low'].to_s+ ' degrees and a high of ' + forecast['high'].to_s + ' degrees.'
end
