FactoryBot.define do
  factory :item_purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code    {"111-1111"}
    prefecture_id     {2}
    city           {"横浜市鶴見区"}
    address        {"青山1-1-1"}
    phone_number   {"0901111090"}
  end
end