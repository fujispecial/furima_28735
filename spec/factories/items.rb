FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    description { Faker::Lorem.sentence }
    price {"1000"}
    category_id { "2" }
    status_id { "2" }
    postage_id { "2" }
    prefecture_id { "2" }
    day_id { "2" }
    association :user 
  end
end
