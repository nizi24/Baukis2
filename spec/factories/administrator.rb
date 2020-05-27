FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "member#{n}@example.com" }
    password { "pw" }
  end
end
