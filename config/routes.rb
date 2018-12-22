Rails.application.routes.draw do
  resources :infection_reports
  resources :inventories
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/killallsurvivors', to: "survivors#deleteall"
  delete '/destroyallinventories', to: "inventories#deleteall"
end
