include Warden::Test::Helpers
require 'rails_helper'

describe "User pages" do 
	describe "signup page" do 
		before { visit new_user_registration_path}

		it "should have the title 'Sign up'" do 
      		expect(page).to have_title(full_title('Sign up'))
    	end 

    	it "should have the content 'Sign up'" do 
      		expect(page).to have_content('Sign up')
    	end 	
	end 


	describe "profile page" do 

		let(:user) {FactoryGirl.create(:user)}

    before do 
    login_as(user, :scope => :user)
    visit user_path(user)
    end
		
		it "should have the content 'user.name'"  do
			expect(page).to have_content(user.name)
		end 

		it "should have the title 'user.name'" do 
			expect(page).to have_title(user.name)
		end 

	end 

	describe "sign up proccess" do 

		before { visit new_user_registration_path }

		let(:submit){"Sign up"}

		describe "with invalid information" do 

			it "should not create an user" do

				expect {click_button submit}.not_to change(User, :count )

			end 

		end 

		describe "with valid information" do 

			before do 

				fill_in "Name" , with: "Andres"
				fill_in "Email" , with: "andres@example.com"
				fill_in "Password" , with: "andres11"
				fill_in "Password confirmation" , with: "andres11"
			end 

			it "should create an user" do 
				expect {click_button submit}.to change(User, :count ).by(1)
			end 

		end 

	end 


  describe "edit page" do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
     login_as(user, :scope => :user)
     visit edit_user_registration_path 
    end 

    describe "page information" do

      it "should have the content" do 
      	expect(page).to have_content("Edit")
      end 
  
      it "should  have the title" do 
      	expect(page).to have_title(full_title("Edit user"))
      end

    end

    describe "with invalid information" do
      before { click_button "Update" }

      it "should not edit an user" do 
       expect(page).to have_content('error')
      end 
    end


    describe "with valid information" do 
    	let(:new_name) { "nuevo_nombre"}
    	let(:new_email) { "nuevo@example.com" }

    	before do 

    		fill_in "Name" , with: new_name
    		fill_in "Email" , with: new_email 
    		fill_in "Current password" , with: user.password 
    		click_button "Update"
    	end 

    	it "should have a selector 'successs'" do 
    		expect(page).to have_selector('div.alert.alert-success')
    	end 

    end 

  end


  describe "index page" do 

  	describe "index page content" do 

      let(:userlog) { FactoryGirl.create(:user) }

  		before do 
  			FactoryGirl.create(:user , name: "Bob" , email: "bob@example.com")
  			FactoryGirl.create(:user , name: "Ben" , email: "ben@example.com")
        login_as(userlog, :scope => :user)
  			visit users_path
  		end 

  		it "should have the title 'All users'" do  
  			expect(page).to have_title(full_title("All users"))	
  		end 

  		it "should have the content 'All users'" do 
  			expect(page).to have_content('All users')
  		end 

  		it "should list each user" do 
  			User.all.each do |user|
          if userlog != user 
  				  expect(page).to have_selector('li' , text: user.name)
  			  end 
        end
  		end 
  	
  	end 
  end 


  describe "delete users" do 

    let(:user) { FactoryGirl.create(:user) }
    
    before do
     login_as(user, :scope => :user)
     visit edit_user_registration_path 
    end 

    it "should have the button 'delete'" do 
      click_button "Cancel my account"
    end 

    it "should delete a user" do 
      expect { click_button "Cancel my account"}.to change(User , :count).by(-1)
    end 

  end 


  ######## test to micropost ############


  describe "profile page with micropost" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user , content: "Hola mundo") }
    let!(:m2) { FactoryGirl.create(:micropost , user: user , content: "Segundo post") }

    before do
     login_as(user, :scope => :user)
     visit user_path(user) 
    end 

    
    it "should have the user name" do 
      expect(page).to have_content(user.name)
    end 

    describe "micropost fields" do
      it " first micropost should have a content" do 
        expect(page).to have_content(m1.content)
      end

      it "second micropost should have  a content" do 
        expect(page).to have_content(m2.content)
      end 

      it "should have two micropost" do 
        expect(page).to have_content(user.microposts.count)
      end 
    end


  end




end 