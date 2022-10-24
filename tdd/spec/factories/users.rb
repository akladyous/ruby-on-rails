FactoryBot.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    email { "#{first_name}_#{last_name}@exmpale.com" }
    active true
  end

  factory :random_users, class: User do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence(:email) { |n| "#{first_name}_#{n}@exmpale.com" }
    active { [true, false].sample }
  end
end
