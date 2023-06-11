Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    namespace :v1 do
      resources :project_sets, only: :create
    end
  end
  resources :projects, only: :index
  root "projects#index"
end
