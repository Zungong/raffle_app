# frozen_string_literal: true

FactoryBot.define do
  factory :raffle do
    sequence(:name) { |n| "test raffle #{n}" }
  end
end
