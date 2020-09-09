Rails.application.routes.draw do
  get '/' => "main#index"
  post "update" => "main#update"
  get "show" => "main#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
