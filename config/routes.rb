Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'questions#index'
  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'point_edit' => 'users#point_edit'
    patch 'point_update' => 'users#point_update'
    get 'unsubscribe' => 'users#unsubscribe'
  end
  resources :questions do
    resources :answers, only: [:create, :destroy, :edit, :update] do
      get 'best' => 'answers#best'
    end
  end
end
