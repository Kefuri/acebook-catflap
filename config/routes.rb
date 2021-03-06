Rails.application.routes.draw do
  

  get 'welcome/index'

  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/yours", to: "posts#yours"
  get "posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: 'post'
  
  resources :posts do
    member do
      put "like" => "posts#like"
      put "unlike" => "posts#unlike"
    end
  end
  
  resources :comments, only: [:create] do
    member do
      put "like" => "comments#like"
      put "unlike" => "comments#unlike"
    end
  end
  get '*path' => redirect('/users/new')
end
