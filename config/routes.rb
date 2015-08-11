Rails.application.routes.draw do

 
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users, only:[:show, :index]
  
  root 'static_pages#home'

  get 'schools' => 'legendopedia#schools'
	get 'legendopedia' => 'legendopedia#main' 
	post 'show_schools' => 'legendopedia#show_schools' 
	get 'spells' => 'legendopedia#spells'
	post 'show_spells' => 'legendopedia#show_spells'
  
  get 'about' 	=>	'static_pages#about'
  get	'contact'	=>	'static_pages#contact'
  get	'to_do'		=>	'static_pages#to_do'

  resources :announcements, only: [:new,:create,:update,:edit,:destroy,:show] do
  	resources :comments, only: [:create, :destroy]
  end

end
