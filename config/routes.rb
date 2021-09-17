Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'search' => 'questions#search'
  resources :notifications, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'add_new_point' => 'users#add_new_point'
    post 'add_point' => 'users#add_point'
    get 'unsubscribe' => 'users#unsubscribe'
    get 'index_of_answers' => 'users#index_of_answers'
    get 'index_of_questions' => 'users#index_of_questions'
  end
  resources :questions do
    get 'update_accepting' => 'questions#update_accepting'
    resources :answers, only: [:show, :new, :create, :destroy, :edit, :update] do
      get 'best' => 'answers#best'
    end
  end
end
