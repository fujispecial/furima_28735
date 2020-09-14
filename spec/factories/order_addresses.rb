FactoryBot.define do
  factory :order_address do
    token { 'testcard' }
    postal_code { '111-1111' }
    prefecture_id { '2' }
    city { '札幌市' }
    address { '1-1-1' }
    building { '建物名'}
    tel { '09099999999' }
  end
end
