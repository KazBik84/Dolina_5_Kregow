Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about' 	=>	'static_pages#about'
  get	'contact'	=>	'static_pages#contact'
  get	'to_do'		=>	'static_pages#to_do'

  resources :announcements, only: [:new,:create,:update,:edit,:destroy,:show] do
  	resources :comments, only: [:create, :destroy]
  end

end
