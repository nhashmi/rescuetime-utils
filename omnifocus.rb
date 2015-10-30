require 'date'
require 'httparty'
require 'dotenv'
require 'uri'

Dotenv.load

key = ENV['RESCUETIME_KEY']
today = Date.today

project_size = nil
until ['big', 'small'].include? project_size do
  puts "Was this a big or small project?"
  project_size = gets.chomp.downcase
end

project_size += " OmniFocus project"
project_size = URI.escape(project_size)

print "Describe your project: "
highlight = gets.chomp
time = Time.now
description = time.strftime("%I:%M%P") + ": " + highlight
escaped_desc = URI.escape(description)

HTTParty.post("https://www.rescuetime.com/anapi/highlights_post?key=#{key}&highlight_date=#{today}&description=#{escaped_desc}&source=#{project_size}")
