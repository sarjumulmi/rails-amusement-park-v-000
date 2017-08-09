Rails.application.routes.draw do
  root 'welcome#home'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: :user
  get '/users/:id/edit' => 'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  resources :attractions

  get '/signin'=>'sessions#new'
  post '/sessions' =>'sessions#create'
  get '/signout' =>'sessions#destroy'

  post '/rides' => 'rides#create'

end
