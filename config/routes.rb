Rails.application.routes.draw do
  get 'welcome/index'

  resources :signups

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
