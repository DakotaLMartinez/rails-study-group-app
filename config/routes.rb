Rails.application.routes.draw do
  resources :inquiries
  resources :teams, param: :slug
  resources :posts, param: :slug
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end