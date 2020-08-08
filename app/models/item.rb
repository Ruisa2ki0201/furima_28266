class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :bunder
  belongs_to_active_hash :shipment
  belongs_to_active_hash :area
  has_one_attached :image
  belongs_to :user
  has_one :address

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :genre_id
    validates :status_id
    validates :bunder_id
    validates :shipment_id
    validates :area_id
  end

  validates :genre_id, numericality: { other_than: 1 }

  validates :status_id, numericality: { other_than: 1 }

  validates :bunder_id, numericality: { other_than: 1 }

  validates :shipment_id, numericality: { other_than: 1 }

  validates :area_id, numericality: { other_than: 1 }

  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  validates :price, numericality: { greater_than: 300 }

  def previous
    Item.where('id < ?', id).order('id DESC').first
  end

  def next
    Item.where('id > ?', id).order('id ASC').first
  end
end
