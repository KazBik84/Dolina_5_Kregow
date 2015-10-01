Rails.application.routes.draw do

 
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users, only:[:show, :index]
  
  root 'static_pages#home'

  get 'schools' => 'legendopedia#schools'
	get 'legendopedia' => 'legendopedia#main' 
	post 'show_schools' => 'legendopedia#show_schools' 
	get 'spells' => 'legendopedia#spells'
	post 'show_spells' => 'legendopedia#show_spells'
	get 'traits' => 'legendopedia#traits'
	post 'show_traits' => 'legendopedia#show_traits'
  get 'clans' => 'legendopedia#clans'
  post 'show_clan' => 'legendopedia#show_clan'
  get 'skills' => 'legendopedia#skills'
  post 'show_skills' => 'legendopedia#show_skills'
   
  get 'about' 	=>	'static_pages#about'
  get	'contact'	=>	'static_pages#contact'
  get	'to_do'		=>	'static_pages#to_do'
  get 'osw' => 'static_pages#osw'
  get 'osw_show' => 'static_pages#osw_show'
  post 'osw_show' => 'static_pages#osw_show'
  get 'web_scrolls' => 'static_pages#web_scrolls'

  resources :announcements, except: [:index] do
  	resources :comments, only: [:create, :destroy]
  end

end
