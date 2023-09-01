FactoryBot.define do
  factory :doctor do
    full_name { "Olivia Octavius" }
    phone { "0123456789" }
    password { "password" }
    category
  end
end
