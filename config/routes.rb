Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/marinas/new', to: 'marinas#new'
  get '/marinas/:id', to: 'marinas#show'
  post '/marinas', to: 'marinas#create'
  get '/marinas/:id/edit', to: 'marinas#edit', as: 'edit_marina'
  put '/marinas/:id', to: 'marinas#update'
  get '/marinas/:id/vessels', to: 'marinas#show_vessels'

  get '/vessels', to: 'vessels#index'
  get '/vessels/new', to: 'vessels#new'
  get '/vessels/:id', to: 'vessels#show'
  post '/vessels', to: 'vessels#create'

  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'

  get '/pilots', to: 'pilots#index'
  get '/pilots/:id', to: 'pilots#show'
end
