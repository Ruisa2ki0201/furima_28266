class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_cod, :shipment_id, :cities, :address, :build_name, :phone_number, :user_id, :item_id, :token
  

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cod: postal_cod, shipment_id: shipment_id, cities: cities, address: address, build_name: build_name, phone_number: phone_number, item_id: item_id)
  end
end