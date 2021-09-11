Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'questions#index'
  get 'search' => 'questions#search'
  resources :notifications, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'add_new_point' => 'users#add_new_point'
    post 'add_point' => 'users#add_point'
    get 'unsubscribe' => 'users#unsubscribe'
  end
  resources :questions do
    get 'update_accepting' => 'questions#update_accepting'
    resources :answers, only: [:new, :create, :destroy, :edit, :update] do
      get 'best' => 'answers#best'
    end
  end
end
