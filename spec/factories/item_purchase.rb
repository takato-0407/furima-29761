FactoryBot.define do
  factory :item_purchase do
    association :user
    association :item
  end
end
