Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marinas', to: 'marinas#index'
  get '/vessels', to: 'vessels#index'
  get '/airlines', to: 'airlines#index'
  get '/pilots', to: 'pilots#index'
  get '/airlines/:id', to: 'airlines#show'
end
