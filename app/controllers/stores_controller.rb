class StoresController < ApplicationController

  def index
    if params[:search]
      zip = params[:search]
      if params[:page]
        response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&page=2&apiKey=#{ENV["best_buy_api_key"]}")
      end
      @stores = Bestbuy.find_stores(zip)
      @total = Bestbuy.total_stores(zip)
    end
  end

end
