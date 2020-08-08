class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_cod, :shipment_id, :cities, :address, :build_name, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_cod, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は-を含む7桁で入力してください'}
    validates :shipment_id
    validates :cities
    validates :address
    validates :build_name
    validates :phone_number
  end

  def save
    binding.pry
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cod: postal_cod, shipment_id: shipment_id, cities: cities, address: address, build_name: build_name, phone_number: phone_number, item_id: item_id)
  end
end