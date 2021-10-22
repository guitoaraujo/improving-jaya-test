# frozen_string_literal: true

FactoryBot.define do
  factory :webhook_request, class: 'Hash' do
    initialize_with do
      {
        'action' => 'opened',
        'issue' => {
          'id' => 1_032_319_820,
          'number' => 3,
          'user' => {
            'login' => 'guitoaraujo',
            'id' => 33_427_463
          }
        }
      }
    end
  end
end
