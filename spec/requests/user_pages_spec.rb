require 'rails_helper'

describe "User pages" do 
	describe "signup page" do 
		before { visit new_user_path }

		it "should have the title" do 
      		expect(page).to have_title(full_title('Sign up'))
    	end 

    	it "should have the content 'Sign up'" do 
      		expect(page).to have_content('Sign up')
    	end 	
	end 


	describe "profile page" do 

		let(:user) {FactoryGirl.create(:user)}
		before {visit user_path(user)}

		it "should have the content 'user.name'"  do
			expect(page).to have_content(user.name)
		end 

		it "should have the title 'user.name'" do 
			expect(page).to have_title(user.name)
		end 

	end 

	describe "sign up proccess" do 

		before { visit new_user_path }

		let(:submit){"Create my account"}

		describe "with invalid information" do 

			it "should not create an user" do

				expect {click_button submit}.not_to change(User, :count )

			end 

		end 

		describe "with valid information" do 

			before do 

				fill_in "Name" , with: "Andres"
				fill_in "Email" , with: "andres@example.com"
				fill_in "Password" , with: "andres1"
				fill_in "Confirmation" , with: "andres1"
			end 

			it "should create an user" do 
				expect {click_button submit}.to change(User, :count ).by(1)
			end 

		end 


	end 

end 