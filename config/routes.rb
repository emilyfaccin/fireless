Rails.application.routes.draw do
  resources :fire_reports, only: [:create, :index]
end
