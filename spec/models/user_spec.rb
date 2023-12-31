require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての入力項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
    it "passwordが英数混合であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
    it 'emailは@を含むと登録できる' do
      @user.email = 'test@mail'
      @user.valid?
      expect(@user).to be_valid
    end
    it '重複したemailがなければ登録できる' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが一致すると登録できる' do
      @user.password = '123aaa'
      @user.password_confirmation = '123aaa'
      expect(@user).to be_valid
    end
  end

    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
    end
    it '全角文字を含むpasswordでは登録できない' do
      @user.password = '１000aa'
      @user.password_confirmation = '１000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123aaa'
      @user.password_confirmation = '123bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #本人情報確認のテスト#

    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it 'first_name_kanjiに半角文字が含まれていると登録できない' do
      @user.first_name_kanji = 'ｷ村'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid. Input full-width characters.")
    end
    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'first_name_kanjiに半角文字が含まれていると登録できない' do
      @user.first_name_kanji = 'ﾀ郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid. Input full-width characters.")
    end
   
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
      @user.last_name_kana = '木むら'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
      @user.first_name_kana = '太ろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end
