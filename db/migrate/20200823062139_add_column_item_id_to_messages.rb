class AddColumnItemIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :item_id, :integer
  end
end
