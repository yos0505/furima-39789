FactoryBot.define do
  factory :item do
    name                 { 'カレンダー' }
    description          { '2024年度のカレンダーです' }
    category_id          { 2 }
    condition_id         { 2 }
    shipping_charge_id   { 2 }
    shipping_from_id     { 2 }
    shipping_day_id      { 2 }
    price                { 2000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/28241370_s.jpg'), filename: '28241370_s.jpg')
  end
end
