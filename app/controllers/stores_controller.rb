class StoresController < ApplicationController

  def index
    if params[:search]
      zip = params[:search]
      if params[:page]
        @stores = Bestbuy.find_page(page = params[:page])
      end
      @stores = Bestbuy.find_stores(zip)
      @total = Bestbuy.total_stores(zip)
    end
  end

end
