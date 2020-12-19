Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'pages/home'

      resources :sessions, only: %i[create]
    end
  end
  # root to: 'pages#home'
end
