Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :recipes
  resources :categories
  resources :ingredients, except: [:destroy]

  resources :recipes do
    resources :comments, only: [:create]
    resources :recipe_ingredients, only: [:edit, :update]
  end

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'pbrbeta', to: 'recipes#pbrbeta'
end
