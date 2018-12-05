class StoreItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :store
end
