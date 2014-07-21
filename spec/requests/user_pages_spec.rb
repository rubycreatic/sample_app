require 'rails_helper'

describe "User pages" do 
	describe "signup page" do 
		before { visit signup_path }

		it "should have the title" do 
      		expect(page).to have_title(full_title('Sign up'))
    	end 

    	it "should have the content 'Sign up'" do 
      		expect(page).to have_content('Sign up')
    	end 	
	end 
end 