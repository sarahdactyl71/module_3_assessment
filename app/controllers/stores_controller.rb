class StoresController < ApplicationController

  def index
    if params[:search]
      zip = params[:search]
      @stores = Bestbuy.find_stores(zip)
    end
  end

end
