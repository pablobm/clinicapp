FactoryBot.define do
    factory :appointment do
        doctor { association :doctor } 
        user { association :user } 
        
        after(:create) do |appointment|
            create(:prescription, appointment: appointment)
    
        end
    end
end