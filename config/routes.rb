Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Log-in
      resources :sessions,      only: %i[create delete]
      # Sign-up
      resources :registrations, only: %i[create]
      # Log-out
      delete :logout, to: 'sessions#destroy'
      # Log-Status
      get :logged_in, to: 'sessions#logged_in'
      # Check User Exist?
      get :check_user, to: 'sessions#check_user'

      # SmartLinks / Rules
      resources :smart_links do
        resources :language_rules
      end
    end
  end
end
