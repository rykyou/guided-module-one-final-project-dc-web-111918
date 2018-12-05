class CreateStoreItems < ActiveRecord::Migration[5.0]
  def change
    create_table :store_items do |t|
      t.integer :item_id
      t.integer :store_id
    end
  end
end
