Rails.application.routes.draw do
  get 'pins/index'
  get 'pins/new'
  get 'pins/edit'
  get 'pins/create'
  get 'pins/show'
  resources :pins do
    resources :likes
  end
  #devise_for :users
  #devise_for :users, controllers: {
  #  sessions: 'users/sessions'
  #}
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pins#index'
  get 'mypins' => 'pins#mypins'
  get 'pinsof/:user_id'=>'pins#pinsof', :as =>'pinsof'

  get 'pin/:id', to: 'pins#show'
end
