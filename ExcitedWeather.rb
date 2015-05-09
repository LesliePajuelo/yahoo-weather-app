require 'yahoo_weatherman'

def find_weather(zip)
client = Weatherman::Client.new
weather = client.lookup_by_location(zip)
text = client.lookup_by_location(zip).condition['text']
puts "Currently, it is #{text}"

return weather
end

puts "Enter a zip code"

#Accept location, assign location to a variable
zip = gets.to_s

#call method
weather = find_weather(zip)
