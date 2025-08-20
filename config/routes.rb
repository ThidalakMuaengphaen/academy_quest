Rails.application.routes.draw do
  resources :quest_lists
  get "up" => "rails/health#show", as: :rails_health_check

  root "quest_lists#index"
  get "/brag" => "brag#index", as: :brag
end
