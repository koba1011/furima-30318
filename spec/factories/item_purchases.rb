FactoryBot.define do
  factory :item_purchase do
    token         {"tok_abcdefghilk00000000000000000"}
    postal_code   {"123-4567"}
    prefecture_id { 2 }
    city          {"新宿区"}
    house_number  {"新宿1-1-1"}
    building_name {"新宿タワー50F"}
    phone_number  {"09012345678"}
  end
end
