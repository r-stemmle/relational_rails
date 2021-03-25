Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/marinas/:id', to: 'marinas#show'

  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'

  get '/airlines', to: 'airlines#index'

  get '/pilots', to: 'pilots#index'

end
