Rails.application.routes.draw do
  get 'campaigns/index'
  get 'campaigns/new'
  get 'campaigns/create'
  get 'campaigns/show'
  get 'campaigns/update'
  get 'campaigns/destroy'
  get 'campaigns/edit'
  get 'charities/index'
  get 'charities/new'
  get 'charities/create'
  get 'charities/show'
  get 'charities/update'
  get 'charities/destroy'
  get 'charities/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :charities do
    resources :campaigns#, except: [:index]
  end

  resources :campaigns, only: [:index]

  get 'about', to: 'pages#about', as: 'about'
  get "help", to: "pages#help", as: 'help'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/search' => 'search#index'

end
