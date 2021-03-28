Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/marinas/:id', to: 'marinas#show'
  get '/marinas/:id/vessels', to: 'marinas#show_vessels'

  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'

  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'
  get '/airlines/:id/pilots', to: 'airlines#show_pilots'

  get '/pilots', to: 'pilots#index'
  get '/pilots/:id', to: 'pilots#show'
end
