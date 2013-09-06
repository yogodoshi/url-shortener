FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "teste-#{n}@teste.com" }
    password "123deoliveira4"
    password_confirmation "123deoliveira4"
  end
end
