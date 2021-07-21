FactoryBot.define do
  factory :purchase_record do
    association :user,:product

  end
end
