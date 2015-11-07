Rails.application.routes.draw do
  
  resources :events do
  	resources :tickets
  end
  devise_for :users
  root 'welcome#index'

end
