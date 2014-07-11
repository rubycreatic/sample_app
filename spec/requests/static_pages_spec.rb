require 'spec_helper'

describe "StaticPages" do 

  describe "Home Page" do 

    before { visit root_path}  
    
    it "should have the title 'Sample App'" do
      expect(page).to have_title(full_title('Home'))
    end 


    it "should have the content 'Sample App' " do 
      expect(page).to have_content('Sample App')
    end 	
  
  end 

  describe "Help Page" do 

    before { visit help_path}

    it "should have the title" do 
      expect(page).to have_title(full_title('Help'))
    end 

    it "should have the content 'Help'" do 
      expect(page).to have_content('Help')
    end 	
  end 

  describe "About Page" do 

    before { visit about_path}

    it "should have the title" do 
      expect(page).to have_title(full_title('About'))
    end 

    it "should have the content 'About Us'" do 
      expect(page).to have_content('About Us')
    end 	
    
  end 

  describe "Contact page" do 

    before { visit contact_path}

    it "should have the title 'Contact'" do 
      expect(page).to have_title(full_title('Contact'))
    end

    it "should have the content 'Contact'" do 
      expect(page).to have_content("Contact")
    end  

  end 
    
end 	

