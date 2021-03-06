# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    raffle
    sequence(:email) { |n| "test_#{n}@example.com" }
  end
end
