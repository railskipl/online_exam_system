Rails.application.routes.draw do
  
  resources :exams

  resources :users

  devise_for :adminsections


 
 # get '/instruction/:id' => "users#show" , :as => :exam_test
# get '/instruction/:id' => "exams#"

get '/instruction/:id' => "users#instruction",:as => 'instruction'

  root 'users#new'
  
  get '/index'=> 'admins#index'


  get '/add_new_test'=>'admins#add_new_test'

  get '/results'=>'admins#result'

   # get '/instruction' => "users#instruction"

  get 'exam/:id'=> 'users#exam',:as => 'exam_test' 
end
