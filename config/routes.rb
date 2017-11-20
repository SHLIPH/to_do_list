Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "lists#index"

  #resources :lists
  resources :lists do
    member do
      post :is_done
    end
  end
end
