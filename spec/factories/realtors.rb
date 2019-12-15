FactoryBot.define do
  factory :realtor do
    ratings { 1.5 }
    number_of_deals_completed { 1 }
    number_of_deals_taken { 2 }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    date_of_birth { FFaker::Time.date }
    email { FFaker::Internet.unique.email }
    phone { FFaker::PhoneNumberDE.international_phone_number }
  end
end
