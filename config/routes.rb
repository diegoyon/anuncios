Rails.application.routes.draw do
  get 'user/show'
  # get 'splash/home'
  # get '/announcements', to: 'announcements#index'
  # get '/announcements/new', to: 'announcements#new'
  resources :announcements, only: [:index, :show, :new, :create]
  resources :seen_announcements, only: [:new, :create, :edit, :update]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#home"
end
