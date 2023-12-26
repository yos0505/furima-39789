FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    encrypted_password    {'000000'}
    last_name_kanji       {'山田'}
    fistt_name_kanji     {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'2023-12-26'}
  end
end