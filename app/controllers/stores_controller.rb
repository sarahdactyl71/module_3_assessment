class StoresController < ApplicationController

  # attr_reader :name, :city, :distance, :phone, :type
  #
  # def initialize(info)
  #   @name = info["longName"]
  #   @city = info["city"]
  #   @distance = info["distance"]
  #   @phone = info["phone"]
  #   @type = info["storeType"]
  # end

  def index
    if params[:search]
      zip = params[:search]
      BestbuyService.find_stores(zip)
      @stores.map do |info|
        new(info)
      end
    end
  end

end
