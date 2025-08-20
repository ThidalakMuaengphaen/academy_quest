Rails.application.routes.draw do
  resources :quest_lists, only: [ :index, :create, :update, :destroy ]
  get "up" => "rails/health#show", as: :rails_health_check

  root "quest_lists#index"
  get "/brag" => "brag#index", as: :brag

  get "*path", to: redirect("/")
end
