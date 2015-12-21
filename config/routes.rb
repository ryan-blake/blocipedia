Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
  root to: 'user#show', as: :authenticated_root
end
# root to: "users#show", as: :authenticated_root

  root to: 'home#index'

end
