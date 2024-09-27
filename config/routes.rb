Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get "movies", to: "movies#index"
  get "movies/new", to: "movies#new", as: :new_movie
  post "movies", to: "movies#create"
  get "movies/:id", to: "movies#show", as: :movie
  get "movies/:id/edit", to: "movies#edit", as: :edit_movie
  patch "movies/:id", to: "movies#udpate"
  delete "movies/:id", to: "movies#destroy"

  resources :lists, except: [ :edit, :update ]
end
