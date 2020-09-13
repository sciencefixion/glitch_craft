Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to:redirect('/')
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/search', to: 'search#index'
end
