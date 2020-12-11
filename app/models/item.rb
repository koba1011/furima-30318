class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
end
