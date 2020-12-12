class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
end
