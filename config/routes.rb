Rails.application.routes.draw do
  get 'user/show'
  # get 'splash/home'
  # get 'announcements/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#home"
end
