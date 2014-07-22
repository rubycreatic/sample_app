FactoryGirl.define do 

	factory :user do 

     sequence(:name) { |n|  "Pepito#{n}" }
     sequence(:email) { |n| "johndoe#{n}@example.com"}
     password "password"
     password_confirmation "password"

	end 


	factory :micropost do 
     content "hola bienvenido a mi blog"
     user 
	end 

end 