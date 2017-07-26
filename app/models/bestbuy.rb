class Bestbuy

  attr_reader :name, :city, :distance, :phone, :type

  def initialize(info)
    @name = info["longName"]
    @city = info["city"]
    @distance = info["distance"]
    @phone = info["phone"]
    @type = info["storeType"]
  end

  def self.find_stores(zip)
    BestbuyService.find_stores(zip)
  end
end
