class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, presence: true, format: {with: /\A[0-9]+\z/, message: "Half-width number"}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  end
  validates :category_id, numericality: { other_than: 1, message: "select" } 
  validates :status_id, numericality: { other_than: 1, message: "select" }
  validates :postage_id, numericality: { other_than: 1, message: "select" }
  validates :prefectures_id, numericality: { other_than: 1, message: "select" }
  validates :days_id, numericality: { other_than: 1, message: "select" }
end
