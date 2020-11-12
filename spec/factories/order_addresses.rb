FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '市' }
    house_number { '区' }
    building { 'ビル' }
    phone_number { '00000000000' }
  end
end