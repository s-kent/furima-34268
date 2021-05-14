FactoryBot.define do
  factory :product do
    name                {'テスト'}
    description         {'テスト'}
    price               {1000}
    status_id           {2}
    shipping_charges_id {2}
    prefecture_id       {2}
    shipping_days_id    {2}
    category_id         {2} 
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end