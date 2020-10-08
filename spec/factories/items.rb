FactoryBot.define do
  factory :item do
    name                   {"aaa"}
    price                  {"1111"}
    info                   {"aaaa"}
    scheduled_delivery_id  {1}
    shipping_fee_status_id {1}
    prefecture_id          {1}
    sales_status_id        {1}
    category_id            {1}
    user                
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

