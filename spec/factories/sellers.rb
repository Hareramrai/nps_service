FactoryBot.define do
  factory :seller do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    date_of_birth { FFaker::Time.date }
    email { FFaker::Internet.unique.email }
    phone { FFaker::PhoneNumberDE.international_phone_number }
    number_of_listing { 1 }
  end
end
