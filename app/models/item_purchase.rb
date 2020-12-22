class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: "Input only number" }, length: { maximum: 11 }
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end
end
