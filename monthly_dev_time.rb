require 'date'
require 'httparty'
require 'dotenv'
Dotenv.load

key = ENV['RESCUETIME_KEY']

today = Date.today
last_month = today - 30

response = HTTParty.get("https://www.rescuetime.com/anapi/data?key=#{key}&perspective=rank&restrict_kind=overview&restrict_begin=#{last_month}&restrict_end=#{today}&format=json")

dev_category = response["rows"].select { |category| category[-1] == "Software Development" }
dev_category.flatten! 
dev_time_seconds = dev_category[1]
dev_time_hours = dev_time_seconds / 3600
dev_time_minutes = (dev_time_seconds % 3600) / 60

puts "You have spent #{dev_time_hours} hours on software development in the last 30 days."
puts "That works out to #{(dev_time_hours / 30.0).round(2)} hours per day."
