class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                             null: false
      t.integer :image_id,                        null: false
      t.integer :category,                        null: false
      t.integer :price,                           null: false
      t.integer :date_of_shipment_id,             null: false
      t.integer :spping_region_id,                null: false
      t.integer :bunder_id,                       null: false
      t.integer :product_status_id,               null: false
      t.timestamps
    end
  end
end
