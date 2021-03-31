Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/marinas/:id', to: 'marinas#show'
  get '/marinas/:id/vessels', to: 'marinas#show_vessels'

  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'

  
  get '/airlines/:id/edit', to: 'airlines#edit'
  get '/airlines/new', to: 'airlines#new'
  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'
  get '/airlines/:airline_id/pilots', to: 'airline/pilots#index'
  post '/airlines', to: 'airlines#create'
  patch '/airlines/:id', to: 'airlines#update'
  get '/airlines/:airline_id/pilots/:id/edit', to: 'airline/pilots#edit'
  # get '/airlines/:airline_id/pilots/:id', to: 'airlines/pilots#show'
  
  get '/pilots/:id/edit', to: 'pilots#edit'
  get '/pilots', to: 'pilots#index'
  get '/pilots/:id', to: 'pilots#show'
end
