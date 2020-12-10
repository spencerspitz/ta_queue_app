Rails.application.routes.draw do
  get 'responses/create'
  get 'responses/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "requests#index"
  resources :requests
  resources :stacks do
    resources :responses
  end 
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
