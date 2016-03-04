require 'faker'

FactoryGirl.define do
  factory :department do
    name Faker::Hipster.word
  end
end
