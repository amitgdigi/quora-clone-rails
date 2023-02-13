Rails.application.routes.draw do 
  root to:'questions#index'

  get '/ques',to: 'pages#user_questions'
  get '/ans',to: 'pages#user_answers'
  # get 'pages/about'
  # get '/home', to:'pages#home'
  devise_for :users
  resources :questions do
    resources :answers, only: [:new, :show, :create, :destroy]
  end
  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
