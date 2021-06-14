require 'alphavantage'

Alphavantage.configure do |config|
  config.api_key = ENV['ALPHAVANTAGE_API_KEY']
end

#Alphavantage.configuration.api_key = 'BEWOO3HPDP1E35B6'

puts 'Alphavantage'