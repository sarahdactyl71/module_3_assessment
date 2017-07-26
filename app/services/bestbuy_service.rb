class BestbuyService

  def find_stores(params)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=10&apiKey=#{ENV["best_buy_api_key"]}")
  end
end
