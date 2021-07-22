FactoryBot.define do
  factory :purchase_record_reteiler do
    post_code     { '111-2222' }
    prefecture_id { 2 }
    city          { '名古屋市' }
    address       { '中区' }
    build_name    { 'asd' }
    phone_number  { '09099998888' }
    user_id       { 1 }
    product_id    { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
