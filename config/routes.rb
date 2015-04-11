Rails.application.routes.draw do
  root "notes#index"

  resources :notes
end
