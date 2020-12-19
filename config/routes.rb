Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Log-in
      resources :sessions,      only: %i[create]
      # Sign-up
      resources :registrations, only: %i[create]
      # Log-out
      delete :logout, to: 'sessions#logout'
      # Log-Status
      get :logged_in, to: 'sessions#logged_in'
    end
  end
  # root to: 'pages#home'
end
