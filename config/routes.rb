Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "requests#index"
  resources :requests, :stacks
  
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
end
