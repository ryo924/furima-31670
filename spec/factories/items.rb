FactoryBot.define do
  factory :item do
    name {"a"}
    text {"a"}
    category_id {2}
    condition_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    day_id {2}
    price {10000}
    association :user

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
