Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, only: [:index, :create, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end