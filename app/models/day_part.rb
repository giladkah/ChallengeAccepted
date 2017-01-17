class DayPart < ActiveRecord::Base
  belongs_to :location
  has_many :orders
end
