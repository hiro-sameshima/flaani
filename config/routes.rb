Rails.application.routes.draw do
  # get 'florists/:id' => 'florists#show'
  get 'plans/index'
  
  devise_for :florists, controllers: {
    sessions:      'florists/sessions',
    passwords:     'florists/passwords',
    registrations: 'florists/registrations',
    show:          'florists/show'
  }
  resources :florists, only: [:edit,:show]
  resources :florist do
    resources :shop_addresses
    resources :bouquets
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'flaanis#index'
  resources :flaanis
  resources :shop_address
  resources :dear_persons do
    resources :plans
    resources :favorites, only: [:new,:edit,:create]
  end
end
