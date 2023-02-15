Rails.application.routes.draw do 
  root to:'questions#index'
  
  # get '/:id',to: 'follow#user_questions'
  get '/ques',to: 'pages#user_questions'
  get '/ans',to: 'pages#user_answers'
  # post 'users/:id', to: 'follow#follow'
  # delete 'users/:id', to: 'follow#unfollow'
  # get 'pages/about'
  # get '/home', to:'pages#home'
  devise_for :users  
  # '/:id' 
  #   post :follow
  #   delete :unfollow
  # end;
  resources :questions do
    resources :answers, only: [:new, :show, :create, :destroy]
  end
  # resources :follows, only: [:create, :destroy] 
  resources :topics do
    post :follow
    delete :unfollow
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  