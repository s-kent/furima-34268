FactoryBot.define do
  factory :order_destination do
    postal_code         {'000-0000'}
    prefecture_id       {2}
    city                {'テスト'}
    address             {'テスト'}
    building            {'テスト'}
    phone_number        {'09000000000'}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end