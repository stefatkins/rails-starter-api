FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@studio-hb.com"
    end
    password 'password'
  end
end
