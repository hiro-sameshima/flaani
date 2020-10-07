Rails.application.routes.draw do
  get 'florists/show'
  get 'plans/index'
  # resources :florists , only: [:show]

  devise_for :florists, controllers: {
    sessions:      'florists/sessions',
    passwords:     'florists/passwords',
    registrations: 'florists/registrations',
    show:          'florists/show'
  }
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'flaanis#index'
  resources :flaanis
  resources :dear_persons do
    resources :plans
  end
end
