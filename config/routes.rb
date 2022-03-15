Rails.application.routes.draw do
  resources :first_ascents
  resources :legends
  resources :messages
  resources :comments
  resources :climbs
  resources :mountains
  resources :regions
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
