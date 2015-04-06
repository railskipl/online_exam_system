Rails.application.routes.draw do
  
  resources :exams

  resources :users

  devise_for :adminsections






 
  root 'users#new'
  
  get '/index'=> 'admins#index'


  get '/add_new_test'=>'admins#add_new_test'

  get '/results'=>'admins#result'

  get '/instruction' => "users#instruction"

end
