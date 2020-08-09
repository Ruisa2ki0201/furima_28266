class Address < ApplicationRecord
  belongs_to :item

  with_options presence: true do
    validates :postal_cod
    validates :shipment_id
    validates :cities
    validates :address
    validates :build_name
    validates :phone_number
  end

  REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :postal_cod, with: REGEX,message: 'は-を含む7桁で入力してください'

  NUMBER_REGEX = /\A\d{3}\d{4}\d{4}\z/.freeze
  validates_format_of :phone_number, with: NUMBER_REGEX,message: 'は11桁で入力してください'
end
