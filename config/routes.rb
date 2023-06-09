Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    
  }

  resources :deposits
  resources :credits
  resources :outlays
  resources :incomes
   
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/reset_variable', to: 'statistic#reset_variable', as: 'reset_variable'
 
  get 'statistic', to: 'statistic#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
