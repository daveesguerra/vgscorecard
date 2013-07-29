Vgscorecard::Application.routes.draw do
  devise_for :users

  root :to => "courses#index"
  match "/admin" => "admin/courses#index"
  
  resources :courses, only: [:index, :show] do 
    get "all"
  end
  
  resources :users, only: [:index, :show]
  
  resources :scorecards
  
  namespace :admin do 
    resources :courses
    resources :users
  end
end
