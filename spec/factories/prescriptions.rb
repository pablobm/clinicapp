FactoryBot.define do
    factory :prescription do
        prescript { Faker::Lorem.sentence }
    association :appointment
  end
end