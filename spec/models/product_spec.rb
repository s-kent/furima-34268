require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image,name,description,category_id,status_id,shipping_charges,prefecture_id,shipping_days,priceが存在していれば出品できること' do
        expect(@product).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品できない'  do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'shipping_charges_idが1では出品できない' do
        @product.shipping_charges_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it 'shipping_days_idが1では出品できない' do
        @product.shipping_days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping days must be other than 1")
      end
      it 'status_idが1では出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it 'prefecture_idが1では出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが全角数字では出品できない' do
        @product.price = '１１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英字では出品できない' do
        @product.price = 'aaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英数混合では出品できない' do
        @product.price = 'aa11'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが299以下ではでは出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが10000000以上ではでは出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'userが紐付いていないと出品できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end