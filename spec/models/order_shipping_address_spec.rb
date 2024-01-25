require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    
  end

  describe '購入者情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されtokenがあれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_cordが空だと保存できないこと' do
        @order_shipping_address.post_cord = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.post_cord = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post cord is invalid")
      end
      it 'shipping_from_idを選択していないと保存できないこと' do
        @order_shipping_address.shipping_from_id = '1'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Shipping from can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @order_shipping_address.street_address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_shipping_address.phone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_shipping_address.phone_number = '123456789012'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに半角数字以外が含まれていると保存できないこと' do
        @order_shipping_address.phone_number = '１23456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できないこと" do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できないこと" do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

