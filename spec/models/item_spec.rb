require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      # binding.pry
      @item = FactoryBot.build(:item)
    end
    context '内容に問題がない場合' do
      it "全て正常" do
        expect(@item.valid?).to eq true
      end
    end
    context '内容に問題がある場合' do
      it "nameは空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "infoが空では登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが300円以下ではでは登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが9999999円以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが全角数字では登録できない" do
        @item.price = "４０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "scheduled_delivery_idが空では登録できない" do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
        it "shipping_fee_status_idが空では登録できない" do
        @item.shipping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it "prefecture_idが空の場合登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "sales_status_idが空の場合登録できない" do
        @item.sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it " category_idが空の場合登録できない" do
        @item.category_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
        it "user_idが空の場合登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
        it "imageが空の場合登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "scheduled_delivery_idが1では登録できない" do
        @item.scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
        it "shipping_fee_status_idが1では登録できない" do
        @item.shipping_fee_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it "prefecture_idが1の場合登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "sales_status_idが1の場合登録できない" do
        @item.sales_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it " category_idが1の場合登録できない" do
        @item.category_id  = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end