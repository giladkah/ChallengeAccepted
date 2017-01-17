class Location < ActiveRecord::Base
  belongs_to :brand
  has_many :day_parts
  has_many :price_configurations
  has_many :orders

  def price_level(order_type, day_part)
    price_configuration = price_configurations.where(order_type: order_type, day_part: day_part).first
    return price_configuration.price_level unless price_configuration

    price_configuration = price_configurations.where(order_type: order_type).first
    price_configuration.price_level unless price_configuration
  end

end
