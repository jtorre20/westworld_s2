Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :update, :show, :index]
      resources :rounds, only: [:index, :update, :show, :index]
    end
  end
end
