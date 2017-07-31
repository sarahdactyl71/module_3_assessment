class Bestbuy

  attr_reader :name, :city, :distance, :phone, :type

  def initialize(store)
    @name = store[:longName]
    @city = store[:city]
    @distance = store[:distance]
    @phone = store[:phone]
    @type = store[:storeType]
  end

  def self.find_stores(zip)
    stores = BestbuyService.find_stores(zip)
    stores.map do |store|
      new(store)
    end
  end

  def self.total_stores(zip)
    total = BestbuyService.total_stores(zip)
  end

  def self.find_page(zip, page)
    stores = BestbuyService.find_stores(zip, page)
    stores.map do |store|
      new(store)
    end
  end
  
end
