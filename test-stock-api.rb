require 'dotenv/load'
require 'uri'
require 'net/http'

url = URI("https://real-time-finance-data.p.rapidapi.com/stock-quote?symbol=XEI%2CZSP%2CBTCC%2CETHH%2CMSCI&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = ENV['RAPIDAPI_KEY']
request["X-RapidAPI-Host"] = ENV['RAPIDAPI_HOST']

response = http.request(request)
puts response.read_body
