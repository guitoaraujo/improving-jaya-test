Rails.application.routes.draw do
  resources :events, only: %i[create]
end
