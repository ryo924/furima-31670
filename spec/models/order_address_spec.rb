require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

      it '全ての値が正しく入力されていれば、保存できること' do
        expect(@order_address).to be_valid
      end

      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと保存できないこと' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'prefecture_idが1だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'buildingが空でも保存できること' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end

      it 'phone_numberがハイフンがあると保存できないこと' do
        @order_address.phone_number = '000-00000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが11桁以内でないと保存できないこと' do
        @order_address.phone_number = '00000000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

  end
end