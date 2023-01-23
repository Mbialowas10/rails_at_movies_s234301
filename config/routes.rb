Rails.application.routes.draw do
  resources :pages
  # get 'home/index'
  root to: 'home#index'
  #   get 'production_companies/index'
  #   get 'production_companies/show'
  #   get 'movies/index'
  #   get 'movies/show'
  resources :movies, only: %i[index show] do
    collection do
      get 'search' # movies/search/(:format)
    end
  end

  resources :production_companies, only: %i[index show]
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: 'permalink'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
