Rails.application.routes.draw do

  resources :tenants

  mount Plutus::Engine => "/plutus", :as => "plutus"

  root 'tenants#index'
end
