FactoryBot.define do
  factory :product do
    name                    { 'りんご' }
    description             { '甘くて美味しい' }
    condition_id            { 2 }
    category_id             { 2 }
    delivery_destination_id { 2 }
    prefecture_id           { 2 }
    delivery_date_id        { 2 }
    price                   { 500 }
    user_id                 { 1 }
    image                   { 'test_image.png' }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
