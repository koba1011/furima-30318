require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '#create' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_purchase).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @item_purchase.building_name = nil
      expect(@item_purchase).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @item_purchase.token = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できないこと' do
      @item_purchase.postal_code = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_purchase.postal_code = "1234567"
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Postal code Input correctly")
    end

    it 'prefecture_idが選択されていないと保存できないこと' do
      @item_purchase.prefecture_id = 1
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空では保存できないこと' do
      @item_purchase.city = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空では保存できないこと' do
      @item_purchase.house_number = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @item_purchase.phone_number = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが半角数字だけの正しい形式でないと保存できないこと' do
      @item_purchase.phone_number = "090-1234-5678"
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが11桁以上では保存できないこと' do
      @item_purchase.phone_number ="090123456789"
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
