FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
    username { Faker::Name.initials(number: 2) } # Example: "AB"
    target_weight { Faker::Number.between(from: 35, to: 200) } # Example: Random weight between 50 to 100
    target_date { Faker::Date.forward(days: 30) } # Example: 30 days from today

    # Other attributes from your model...

    trait :invalid do
      email { nil } # Example: Making the user invalid by not providing email
    end
  end
end
