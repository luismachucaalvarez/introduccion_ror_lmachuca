Rails.application.routes.draw do
  get 'pins/edit'
  get 'pins/index'
  get 'pins/show'
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
