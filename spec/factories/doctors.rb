FactoryBot.define do
  factory :doctor do
    full_name { Faker::Name.name }
    phone { "0123456789" }
    password { "password" }
    category
  end
end
