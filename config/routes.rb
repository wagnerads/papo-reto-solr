Rails.application.routes.draw do
  resources :products

  root 'search#index'

  resources :search do
    collection do
      get 'find'
    end
  end
end
