Rails.application.routes.draw do
  # For details on the DSL available within this file, see:
  # http://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  get 'sign_up', to: 'users#new', as: 'sign_up'

  resources :users
  resources :blogs

  root 'welcome#index'
end
