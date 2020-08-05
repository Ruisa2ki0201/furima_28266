class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null:false                       
      t.string :text,            null:false
      t.integer :price,          null:false    
      t.integer :genre_id,       null:false        
      t.integer :status_id,      null:false
      t.integer :bunder_id,      null:false
      t.integer :shipment_id,    null:false
      t.integer :area_id,        null:false
      t.integer :user_id,        null:false
      t.timestamps
    end
  end
end
