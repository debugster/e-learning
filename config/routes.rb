Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get '/', to: 'dashboard#index'
    resources :courses do
      resources :lessons
    end
  end

  namespace :student do
    get 'dashboard', to: 'dashboard#index'
    get '/', to: 'dashboard#index'
    resources :lessons do
      resources :exams, except: [:index]
    end
    resources :exams, only: [:index]
  end

  root 'home#index'
end
