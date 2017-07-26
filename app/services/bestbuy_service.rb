class BestbuyService

  def self.find_stores(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=10&apiKey=#{ENV["best_buy_api_key"]}")
    results = JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
