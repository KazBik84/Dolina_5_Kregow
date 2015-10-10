FactoryGirl.define do
  factory :user do
    username "Kask"
    email "kask@wp.pl"
    password "qwe1234r"  
    password_confirmation "qwe1234r"
    admin false
  end

end
