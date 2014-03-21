require 'spec_helper'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    name Faker::Lorem.word
    password_digest Faker::Lorem.word
    bio Faker::Lorem.paragraph
  end

  factory :goal do
    title Faker::Lorem.word
    description Faker::Lorem.paragraph
    start_date Time.now
    end_date Time.now + 2.weeks
    association :owner, factory: :user
   end
end