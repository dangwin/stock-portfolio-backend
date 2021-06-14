Rails.application.routes.draw do
  resources :users do
    resources :stocks do
      get :price, on: :collection
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
