FactoryBot.define do 
    factory :doctor do
        full_name { Faker::Name.name }
        phone { Faker::PhoneNumber.phone_number.to_s.gsub(/\D/, '')[0, 10] }
        email { Faker::Internet.email }
        password { 'qwerty' } 
        category { association :category, factory: :category }
  end
end