require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'すべての入力項目が存在すれば出品できる' do
      expect(@item).to be_valid
    end
    it "商品名が40文字以下であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
    it "商品の説明が1000文字以下であれば登録できる" do
    end
    it "商品画像があれば登録できる" do
    end