Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about' 	=>	'static_pages#about'
  get	'contact'	=>	'static_pages#contact'
  get	'to_do'		=>	'static_pages#to_do'


end
