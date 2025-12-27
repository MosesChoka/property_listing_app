Rails.application.routes.draw do
  resources :inquiries
  get "inquiries/new"
  get "inquiries/show"
  get "inquiries/edit"
  resources :properties
  get "properties/new"
  get "properties/edit"
  get "properties/destroy"
  root "pages#index"
  get "/gallery", to: "pages#gallery"
  get "/projects", to:  "pages#project"
  get "/contact", to: "pages#contact"
  resource :landlord_role, only: [ :create ]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :admin do
    resources :properties do
      member do
        patch :approve
      end
    end
  end
end
