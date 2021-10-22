# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    action { 'opened' }
    event_type { 'issue' }
    event_number { Faker::Number.number(digits: 4) }
    event_user_name { Faker::Internet.username(specifier: 8) }
    event_user_id { Faker::Number.number(digits: 2) }
    event_id { Faker::Number.number(digits: 4) }
    created_at { 'Thu, 21 Oct 2021 09:43:48.242767000 UTC +00:00' }
    updated_at { 'Thu, 21 Oct 2021 09:43:48.242767000 UTC +00:00' }
  end
end
