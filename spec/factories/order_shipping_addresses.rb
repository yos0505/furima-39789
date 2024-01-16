FactoryBot.define do
  factory :order_shipping_address do
    post_cord         { '123-4567' }
    shipping_from_id  { 2 }
    city              { '横浜市' }
    street_address    { '青山' }
    building_name     { '' }
    phone_number      { '09012345678' }
    order_id          { 1 }
    user_id           { 1 }
    item_id           { 1 }
  end
end
