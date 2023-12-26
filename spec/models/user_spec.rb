require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nicknameが空では登録できない' do
    user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name_kanji: '佐藤', first_name_kanji: '太郎', last_name_kana: 'サトウ', first_name_kana: 'タロウ', birthday: '2023-12-26')
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
  end
end
