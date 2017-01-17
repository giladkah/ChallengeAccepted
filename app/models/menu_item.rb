class MenuItem < ActiveRecord::Base
  belongs_to :brand
  has_many :orders
end
