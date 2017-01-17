class Order < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :order_type
  belongs_to :day_part
  belongs_to :location

  def price
    price_level = location.price_level(order_type, day_part)
    raise 'no price level' unless price_level

    menu_item.price(price_level)
  end

  def create

  end

end
