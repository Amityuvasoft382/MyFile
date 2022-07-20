Rails.application.routes.draw do
  root 'welcomes#index'
  post '/post_id/comments', to: 'comments#new' 
  devise_for :users
  resources :posts do 
    resources :likes
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
