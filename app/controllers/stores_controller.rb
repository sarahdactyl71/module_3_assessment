class StoresController < ApplicationController

  def index
    if params[:search]
      response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=10&apiKey=#{ENV["best_buy_api_key"]}")
      @stores = JSON.parse(response.body)["stores"]
      redirect
    end
  end

end
