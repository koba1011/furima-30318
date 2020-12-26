class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :comments

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
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  
    with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
