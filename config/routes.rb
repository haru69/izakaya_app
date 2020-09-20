Rails.application.routes.draw do
  get '/' => "main#index"
  post "update" => "main#update"
  get "show" => "main#show"


  root to: "main#index"

namespace :api, {format: 'json'} do
  namespace :v1 do
    resources :main, only: [:index]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
