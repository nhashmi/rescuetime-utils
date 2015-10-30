require 'date'
require 'httparty'
require 'dotenv'
require 'uri'

Dotenv.load

key = ENV['RESCUETIME_KEY']
today = Date.today
print "Describe your pomodoro: "
highlight = gets.chomp
end_time = Time.now
start_time = Time.now - (25 * 60)
description = start_time.strftime("%I:%M%P") + "-" +
              end_time.strftime("%I:%M%P") + ": " + highlight
escaped_desc = URI.escape(description)

HTTParty.post("https://www.rescuetime.com/anapi/highlights_post?key=#{key}&highlight_date=#{today}&description=#{escaped_desc}&source=pomodoro")
