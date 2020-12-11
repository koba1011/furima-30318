class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price
  end
  validates :category_id, numericality: { other_than: 1 }
end
