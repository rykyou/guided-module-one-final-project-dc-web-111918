class Store < ActiveRecord::Base
  has_many :store_items
  has_many :items, through: :store_items
end
