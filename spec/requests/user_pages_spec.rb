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


end 