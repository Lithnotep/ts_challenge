Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/people", to: "people#index"
    post "/person", to: "people#create"
    get "/person/:last/:first", to:"people#show"
  end
end
