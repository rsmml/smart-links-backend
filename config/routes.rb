Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions,      only: %i[create]
      resources :registrations, only: %i[create]
    end
  end
  # root to: 'pages#home'
end
