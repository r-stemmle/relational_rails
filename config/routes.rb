Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/marinas/new', to: 'marinas#new'
  get '/marinas/:id', to: 'marinas#show'
  post '/marinas', to: 'marinas#create'
  post '/marinas/:id/vessels', to: 'vessels#create'
  get '/marinas/:id/edit', to: 'marinas#edit', as: 'edit_marina'
  patch '/marinas/:id', to: 'marinas#update', as: 'marina'
  delete '/marinas/:id', to: 'marinas#destroy', as: 'delete_marina'
  get '/marinas/:id/vessels', to: 'marinas#vessels', as: 'marinas_vessels'
  #ask about this route \/\/\/\/
  get '/marinas/:id/vessels_sorted', to: 'marinas#sorted_vessels', as: 'sorted_vessels'

  get '/vessels', to: 'vessels#index'
  get '/vessels/new', to: 'vessels#new'
  get '/vessels/:id', to: 'vessels#show', as: 'vessel_id'
  get '/vessels/:id/edit', to: 'vessels#edit', as: 'edit_vessel'
  patch '/vessels/:id', to: 'vessels#update', as: 'vessel'
  post '/vessels', to: 'vessels#create'

  get '/airlines/new', to: 'airlines#new'
  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'
  get '/airlines/:airline_id/pilots', to: 'airline/pilots#index'
  post '/airlines', to: 'airlines#create'
  # get '/airlines/:airline_id/pilots/:id', to: 'airlines/pilots#show'

  get '/pilots', to: 'pilots#index'
  get '/pilots/:id', to: 'pilots#show'

end
