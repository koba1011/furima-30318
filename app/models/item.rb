class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price
  end
end
