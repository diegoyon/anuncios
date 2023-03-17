Rails.application.routes.draw do
  get 'user/show'
  resources :announcements, only: [:index, :show, :new, :create]
  resources :seen_announcements, only: [:create, :update]
  devise_for :users
  root "splash#home"
end
