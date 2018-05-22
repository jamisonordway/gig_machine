Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :index
  resources :events, only: :index
  resources :users, only: [:new, :show, :index, :create]
  resources :venues, shallow: true do
    resources :events, only: [:new, :edit, :show, :create, :destroy]
  end
end
