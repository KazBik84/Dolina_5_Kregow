FactoryGirl.define do
  factory :comment do
    content "MyText"
		author "MyString"
		announcement nil
		# By właściwie przetestować akcję kontrollera należy dodać wartość 'redirect_to'
		#  w taki sposób do bazwoego factory została dodana Factoria z nazwie ":controller_comment"
		#  do której odnosi się np: attributes_for(:conttroller_comment) i dzięki temu została dodana nowa wartość
		#  która wykorzystywana jest tylko gdy się o nią poprosi.  
		factory :controller_comment do
		  redirect_to "/"
		end
  end


end
