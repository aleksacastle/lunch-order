Rails.application.routes.draw do
  # registration with Tyrant
  get  "sessions/sign_up_form"
  post "sessions/sign_up"

  get  "sessions/sign_out"

  get  "sessions/sign_in_form"
  post "sessions/sign_in"

  resources :users

  resources :menus do
    resources :items
  end

  resources :lunches

  root "menus#show"
end
