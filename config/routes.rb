Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get '/joined/groups' => "groups#joined_group"
  get '/my/groups' => "groups#my_group"

  resource :welcomes 
  resources :groups 
  resources :posts 
  resources :comments 
  resource :dashboards

  root "welcomes#index"
end
