class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  validates :category_id, numericality: { other_than: 1, message: "select" } 
  validates :status_id, numericality: { other_than: 1, message: "select" }
  validates :postage_id, numericality: { other_than: 1, message: "select" }
  validates :prefecture_id, numericality: { other_than: 1, message: "select" }
  validates :day_id, numericality: { other_than: 1, message: "select" }
end
