Rails.application.routes.draw do

 
  get 'characters/new'

  get 'characters/show'

  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users, only:[:show, :index] do
    resources :characters, except: [:index] 
  end

  resources :announcements do
    post :osw_show
    resources :comments, only: [:create, :destroy]
  end  

  root 'announcements#index'

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
   






end
