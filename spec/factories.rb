FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user, :aliases => [:owner, :buddy] do
    email
    name Faker::Lorem.word
    password '1234'
    password_confirmation '1234'
    bio Faker::Lorem.paragraph
    stripe_id Faker::Lorem.word

    trait :img_default do
      image "0"
    end

    trait :img_gravatar do
      image "1"
    end

    trait :img_fb do
      image "http://graph.facebook.com"
    end

    trait :stripe_recipient do
      recipient_id Faker::Lorem.word
    end

  end

  factory :goal do
    title Faker::Lorem.word
    description Faker::Lorem.paragraph
    start_date Time.now
    end_date Time.now + 2.weeks
    owner
    buddy
    trait :incomplete do
      completed false
    end

    trait :complete do
      completed true
    end

    trait :recent do
      start_date Time.now + 4.weeks
    end
   end

   factory :friendship do
    association :user, factory: :user
    association :friend, factory: :user
   end
end