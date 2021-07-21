FactoryBot.define do
  factory :retailer do
    post_code     { "111-2222" }
    prefecture_id { 2 }
    city          { "名古屋市" }
    address       { "中区" }
    build_name    { "asdf" }
    phone_number  { "09099998888" }
  end
end
