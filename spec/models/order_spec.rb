require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,city,address,building,phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でもpostal_code,prefecture_id,city,address,phone_numberが存在すれば購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
  end
end