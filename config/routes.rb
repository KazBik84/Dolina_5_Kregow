Rails.application.routes.draw do
  get 'announcements/new'

  get 'announcements/create'

  get 'announcements/update'

  get 'announcements/edit'

  get 'announcements/destroy'

  get 'announcements/show'
  
  resources :announcements, 
  	only:[:new,:create,:update,:edit,:destroy,:show]

  root 'static_pages#home'

  get 'about' 	=>	'static_pages#about'
  get	'contact'	=>	'static_pages#contact'
  get	'to_do'		=>	'static_pages#to_do'


end
