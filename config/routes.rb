Rails.application.routes.draw do
  devise_for :users
  root 'match#index'
  get  'match/new' => 'match#new'
  post 'match'      =>  'match#create'
  delete  'match/:id'  => 'match#destroy'
  get  'match/:id'   =>  'match#show'
  patch   'match/:id'  => 'match#update'
  get  'match/:id/edit'   =>  'match#edit'
  get  'users/:id'   =>  'users#show'
  post  'match/:id/comments'   =>  'comments#create'  
  resources :match do
    resources :comments, only: [:create]
  end
end
