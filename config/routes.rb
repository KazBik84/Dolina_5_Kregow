Rails.application.routes.draw do


  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users, only:[:show, :index] do
    resources :characters, except: [:index] 
  end

  resources :announcements do
    resources :comments, only: [:create, :destroy]
  end  
  get 'osw_show' => 'announcements#osw_show'
  post 'osw_show' => 'announcements#osw_show'

  root 'announcements#index'

  get 'legendopedia' => 'legendopedia#main', as: 'legendopedia'
  get 'legendopedia/schools' => 'legendopedia#schools', as: 'schools'
	post 'legendopedia/show_schools' => 'legendopedia#show_schools' , as: 'show_schools'
	get 'legendopedia/spells' => 'legendopedia#spells', as: 'spells'
	post 'legendopedia/show_spells' => 'legendopedia#show_spells', as: 'show_spells'
	get 'legendopedia/traits' => 'legendopedia#traits', as: 'traits'
	post 'legendopedia/show_traits' => 'legendopedia#show_traits', as: 'show_traits'
  get 'legendopedia/clans' => 'legendopedia#clans', as: 'clans'
  post 'legendopedia/show_clan' => 'legendopedia#show_clan', as: 'show_clan'
  get 'legendopedia/skills' => 'legendopedia#skills', as: 'skills'
  post 'legendopedia/show_skills' => 'legendopedia#show_skills', as: 'show_skills'
   






end
