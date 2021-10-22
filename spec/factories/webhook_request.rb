FactoryBot.define do
  factory :webhook_request, class: 'Hash' do
    initialize_with do
      {
        'action' => 'opened',
        'issue' => { 
          'id' => 1032319820, 
          'number' => 3, 
          'user' => { 
            'login' => 'guitoaraujo', 
            'id' => 33427463
          }
        }
      }
    end
  end
end
