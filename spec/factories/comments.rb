FactoryGirl.define do
  factory :comment do
    content "MyText"
		author "MyString"
		announcement_id nil
    user_id "1"    
		# Poniżej tworzymy odnośnik do tej faktorii
    #  w tym przypadku, tworzymy faktorie o nazwie 'controller_comment'
    #  i przesyłamy dodatkowy atrybut o nazwie from_url i wartości "/"
    #  robimy tak bo wartość from_url nie jest częścią modelu Comment
    #  ale jest wykorzystywany przez comments_controller 
		factory :controller_comment do
		  from_url "/"
		end
  end


end
