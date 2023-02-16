Rails.application.routes.draw do 
  # root to:'questions#index'
  root to:'pages#home'
  
  # get '/:id',to: 'follow#user_questions'
  get '/ques',to: 'pages#user_questions'
  get '/ans',to: 'pages#user_answers'
  get '/topi_ques',to: 'pages#topic_questions'
  get '/userss',to: 'pages#userss'
  post '/userss/:id', to: 'pages#add_user' ,as:'add'
  delete '/userss/:id', to: 'pages#remo_user' ,as: 'remove'
  # post 'users/:id', to: 'follow#follow'
  # delete 'users/:id', to: 'follow#unfollow'
  # get 'pages/about'
  # get '/home', to:'pages#home'
  devise_for :users 
  # do
  # resources :users do
  #   member do
  #     post :add
  #     delete :remove
  #   end
  # end
  resources :questions do
    resources :topics do
      member do
        post :add_topic
        delete :remove_topic
    end
  end
    resources :answers, only: [:new, :show, :create, :destroy]
  end
  # resources :follows, only: [:create, :destroy] 
  resources :topics do
    post :follow
    delete :unfollow
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  