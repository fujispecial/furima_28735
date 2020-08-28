FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { "田中" }
    first_name { "太郎" }
    family_name_ruby { "タナカ" } 
    first_name_ruby { "タロウ" }
    birth_date { "1985-01-01" }
  end
end