class StoresController < ApplicationController

  def index
    if params[:search]
      zip = params[:search]
      Bestbuy.find_stores(zip)
      # @stores = BestbuyService.find_stores(zip)
    end
  end

end
