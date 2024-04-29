require "json"
require "dotenv/load"
require "uri"
require "net/http"

module RapidApiServices
  class UpdateStockPrices

    def run!
      url = URI("https://real-time-finance-data.p.rapidapi.com/stock-quote?symbol=XEI%2CZSP%2CBTCC%2CETHH%2CMSCI&language=en")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = ENV["RAPIDAPI_KEY"]
      request["X-RapidAPI-Host"] = ENV["RAPIDAPI_HOST"]

      response = http.request(request)
      data = JSON.parse(response.read_body)

      data["data"].each do |info|
        stock = Stock.find_by(api_symbol: info["symbol"])
        stock.update(price: info["price"])
        stock.save!
      end
    end
  end
end
