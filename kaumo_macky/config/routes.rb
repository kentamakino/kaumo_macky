Rails.application.routes.draw do
  

	resource :user do
		get 'retire'
	end

  resources :events do
  	resources :tickets
  end
  devise_for :users
  root 'welcome#index'

  
end
