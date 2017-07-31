class StoresController < ApplicationController

  def index
    if params[:search]
      zip = params[:search]
      @stores = Bestbuy.find_stores(zip)
      @total = Bestbuy.total_stores(zip(enums) { |row|  })
    end
  end

end
