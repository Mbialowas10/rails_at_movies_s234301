Rails.application.routes.draw do
  # resources :pages
  get 'home/index'
  get 'production_companies/index'
  get 'production_companies/show'
  get 'movies/index'
  get 'movies/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get /segment, to:controller#action, as: namedReference # e.g companies_path
  #   GET "/movies"
  #   GET /movies/:index
  #   GET /production_companies
  #   GET clear/production_companies/:id
  root to: 'home#index'
  # resources :movies, only: %i[index show]
  resources :movies
  ### modified this file January 25 at noon ####

  # resources :pages, except: %i[show edit update delete]
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: :permalink
  # get '/pages/:permalink' => 'pages#permalink', as: 'permalink_page'    # show page
  # get '/pages/:permalink/edit' => 'pages#edit', as: 'edit_page'         # load a edit form page
  # patch '/pages/:permalink' => 'pages#update', as: 'update_page'        # update the page
  # delete '/pages/:permalink' => 'pages#destroy', as: 'delete_page'      # delete a page

  #   get '/pages/' => 'pages#index', as: 'pages' # display all pages
  #   get '/pages/:permalink' => 'pages#permalink', as: 'permalink_page' # read a page #something wrong here?
  #   get '/pages/new' => 'pages#new', as: 'new_page' # new page form
  #   post '/pages/create' => 'pages#create', as: 'create_page'
  #   get '/pages/:permalink/edit' => 'pages#edit', as: 'edit_page' # edit a page
  #   patch '/pages/:permalink' => 'pages#update', as: 'upate_page' # update a page
  #   delete '/pages/:permalink' => 'pages#destroy', as: 'delete_page' # delete a page
  resources :production_companies, only: %i[index show]
end
