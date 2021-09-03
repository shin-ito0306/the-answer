Rails.application.routes.draw do
  get 'answers/new'
  get 'answers/create'
  get 'answers/edit'
  get 'answers/update'
  get 'answers/destroy'
  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/create'
  get 'questions/edit'
  get 'questions/udate'
  get 'questions/destroy'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
