Rails.application.routes.draw do
  resources :events, only: %i[create]
  get ':event_type/:event_number/events', to: 'events#index'
end
