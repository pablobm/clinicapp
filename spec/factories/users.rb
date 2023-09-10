FactoryBot.define do
    factory :user do
        full_name { Faker::Name.name }
        email { Faker::Internet.email }
        phone { Faker::PhoneNumber.phone_number.to_s.gsub(/\D/, '')[0, 10] }
        password { 'qwerty' } 
    end
end