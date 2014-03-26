FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email
    name Faker::Lorem.word
    image "/assets/default_user_image.svg"
    password '1234'
    password_confirmation '1234'
    bio Faker::Lorem.paragraph
    stripe_id Faker::Lorem.word
  end

  factory :goal do
    title Faker::Lorem.word
    description Faker::Lorem.paragraph
    start_date Time.now
    end_date Time.now + 2.weeks
    association :owner, factory: :user
    association :buddy, factory: :user
   end

  factory :friendship do
    association :user, factory: :user
    association :friend, factory: :user
  end

end