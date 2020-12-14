require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'imageとname,describe,category_id,condition_id,shipping_fee_id,prefecture_id,shipping_days_id,priceが存在していれば保存できること' do
      expect(@item).to be_valid
    end
    
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'describeが空では保存できないこと' do
      @item.describe = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Describe can't be blank")
    end

    it 'categoryが選択されていないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it 'conditionが選択されていないと保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")
    end

    it 'shopping_feeが選択されていないと保存できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee Select")
    end

    it 'prefectureが選択されていないと保存できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select") 
    end

    it 'shipping_daysが選択されていないと保存できないこと' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days Select")
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceの値が300以下の場合は保存できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceの値が9999999以上の場合は保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが半角数字以外では保存できないこと' do
      @item.price = "２３４５６"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
  end
end
