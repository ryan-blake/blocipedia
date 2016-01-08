Rails.application.routes.draw do

  devise_for :admins
  devise_for :user

  devise_scope :user do
     get '/user/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end
# root to: "users#show", as: :authenticated_root

  root to: 'home#index'

  resources :wikis

end
