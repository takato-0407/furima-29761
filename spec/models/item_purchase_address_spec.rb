require 'rails_helper'
RSpec.describe ItemPurchaseAddress, type: :model do
  describe '購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @item_purchase_address = FactoryBot.build(:item_purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end
    context '内容に問題がない場合' do
      it '全て正常' do
        expect(@item_purchase_address.valid?).to eq true
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @item_purchase_address.token = nil
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @item_purchase_address.postal_code = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが3桁-4桁でなければ登録できない' do
        @item_purchase_address.postal_code = '1234-567'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeに-がなければ登録できない' do
        @item_purchase_address.postal_code = '1234567'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'cityが空だと登録できない' do
        @item_purchase_address.city = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @item_purchase_address.prefecture_id = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1の場合登録できない' do
        @item_purchase_address.prefecture_id = '1'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'addressが空では登録できない' do
        @item_purchase_address.address = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @item_purchase_address.phone_number = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁では登録できない' do
        @item_purchase_address.phone_number = '090012345678'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁では登録できない' do
        @item_purchase_address.phone_number = '090090090'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberに-がついていたら登録できない' do
        @item_purchase_address.phone_number = '090-124-567'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空の場合登録できない' do
        @item_purchase_address.user_id = nil
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合登録できない' do
        @item_purchase_address.item_id = nil
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
