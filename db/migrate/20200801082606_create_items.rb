class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name                        
      t.integer :text
      t.integer :price                
      t.integer :genre_id                
      t.integer :status_id    
      t.integer :bunder_id  
      t.integer :shipment_id
      t.integer :area_id
      t.timestamps
    end
  end
end
