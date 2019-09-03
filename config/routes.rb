Rails.application.routes.draw do

  get 'assemblies/edit'
  get 'assemblies/update'
  get 'products/sell'
  get 'products/upload'

  resources :products, only: [:index, :show, :edit, :update] do
    resources :assemblies, only: [:edit, :update]
  end

  post 'products/import'
  post 'products/update_sell'

  resources :articles, only: [:index, :edit, :update]

  root to: 'products#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
