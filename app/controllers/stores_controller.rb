class StoresController < ApplicationController

  attr_reader :name, :city, :distance, :phone, :type

  def initialize(info)
    @name = info["longName"]
    @city = info["city"]
    @distance = info["distance"]
    @phone = info["phone"]
    @type = info["storeType"]
  end

  def index
    if params[:search]
      response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=10&apiKey=#{ENV["best_buy_api_key"]}")
      @stores = JSON.parse(response.body)["stores"]
      @stores.map do |info|
        new(info)
      end
    end
  end

end
