class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_cod,      null:false
      t.integer :shipment_id,    null:false
      t.string :cities,          null:false
      t.string :address,         null:false
      t.string :build_name,      null:false
      t.string :phone_number,    null:false
      t.integer :item_id,        foreign_key: true
      t.timestamps
    end
  end
end
