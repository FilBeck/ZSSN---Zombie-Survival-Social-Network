Rails.application.routes.draw do
  resources :inventories
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/killallsurvivors', to: "survivors#deleteall"
end
