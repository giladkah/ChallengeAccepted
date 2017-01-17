class Brand < ActiveRecord::Base

  validates :name, uniqueness: true

  has_many :menu_items
  has_many :price_levels
  has_many :order_types
  has_many :locations
end
