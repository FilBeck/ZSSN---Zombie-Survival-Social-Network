Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  delete '/killallsurvivors', to: "survivors#deleteall"
  delete '/destroyallinventories', to: "inventories#deleteall"
  delete '/deleteallreports', to: "infection_reports#deleteall"
  put '/survivors/:id/inventories/trade', to: "inventories#trade"
  get '/statistics', to: "api_statistics#generate_statistics"
  get '/survivors/showinfected', to: "survivors#show_infected"

  resources :infection_reports
  resources :survivors do 
  	resources :inventories
  end
end
