require 'spec_helper'

describe "StaticPages" do 

  describe "Home Page" do 
    
    it "should have the title" do 
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Sample App | Home")
    end 


    it "should have the content 'Sample App' " do 
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end 	
  
  end 

  describe "Help Page" do 

    it "should have the title" do 
      visit '/static_pages/help'
      expect(page).to have_title("Ruby on Rails Sample App | Help")
    end 

    it "should have the content 'Help'" do 
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end 	
  end 

  describe "About Page" do 

    it "should have the title" do 
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Sample App | About")
    end 

    it "should have the content 'About Us'" do 
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end 	
    
  end 





end 	

