Rails.application.routes.draw do
  # For details on the DSL available within this file, see:
  # http://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :blogs
  namespace 'api' do
    namespace 'v1' do
      resources :blogs_api
    end
  end
  root 'welcome#index'
end
