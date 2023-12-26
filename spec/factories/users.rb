FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6) + '1a'}
    password_confirmation {password}
    last_name_kanji       {'山田' }
    first_name_kanji      {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'2023-12-26'}
  end
end