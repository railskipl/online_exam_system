  Rails.application.routes.draw do
  
 resources :exams

  resources :users

  devise_for :adminsections

  resources :userchoices

  post '/results' => "userchoices#score"
  
  get '/papers' => "users#papers", :as => 'papers'

  # get '/instruction' => "users#instruction", :as => 'instruction'
 
  root 'users#new'
  get '/index'=> 'admins#index'


  get '/add_new_test'=>'admins#add_new_test'

  get '/results'=>'admins#result'

  get '/instruction' => "users#instruction"
  get '/finish'=> "userchoices#finish"

  get "exams/:id/close" => "users#close"
  #get "admin/users/:id/block" => "users#block"

 


 
end
