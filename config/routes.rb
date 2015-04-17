Rails.application.routes.draw do
  
  resources :exams

  resources :users

  devise_for :adminsections

  resources :userchoices

  post '/results' => "userchoices#score"
  match '/finish' => "userchoices#evaluate",:as=>"finish",via: [:get, :post]

  get '/papers' => "users#papers", :as => 'papers'

  # get '/instruction' => "users#instruction", :as => 'instruction'
 
  root 'users#new'
  get '/index'=> 'admins#index'


  get '/add_new_test'=>'admins#add_new_test'

  get '/results'=>'admins#result'

  get '/instruction' => "users#instruction"

 
end