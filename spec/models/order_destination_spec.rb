require 'rails_helper'
RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, product_id: product.id)
  end
  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_destination).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_destination.postal_code = '0000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角数字では購入できない' do
        @order_destination.postal_code = '０００−００００'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture＿idが1では購入できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      #it 'phone_numberが11桁以上では購入できない' do
        #@order_destination.phone_number = '000000000000'
        #@order_destination.valid?
        #expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      #end
    end
  end
end