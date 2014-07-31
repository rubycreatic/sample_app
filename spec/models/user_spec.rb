require 'rails_helper'

	describe User do 

		before { @user = User.new(name: "Example User" , email: "user@example.com" , password: "hola_mundo" , password_confirmation: "hola_mundo")}

		describe "user fields" do 

    		it "should have a name field" do 
          		expect(@user).to respond_to(:name)
        	end 

        	it "should have a email field" do 
          		expect(@user).to respond_to(:email)
        	end 

            it "should have a password field" do 
                expect(@user).to respond_to(:password)
            end 

            it "should have a password confirmation field" do 
                expect(@user).to respond_to(:password_confirmation)
            end 

        end 


        describe "The presence validation" do 

            describe "the presence of the name" do 
            
                before{@user.name = ""}
                
                it "is invalid without a name" do 
                    expect(@user).to_not be_valid
                end
            
            end 
  
             describe "the presence of the email" do

                before{@user.email = ""}

                it "is invalid without an email" do 
                    expect(@user).to_not be_valid
                end 

            end   


            describe "the presence of the password " do 
            
                before do 
                    @user.password = ""
                    @user.password_confirmation = ""
                end 

                it "is invalid when the password field is not present" do 
                    expect(@user).to_not be_valid  
                end 
    
             end             

        end 


        describe "the length validation of the name " do 

        	before{@user.name = "a" * 51}

        	it "is invalid when the name is too long" do 
        		expect(@user).to_not be_valid 
        	end 

        end 


        describe "the length validation of the password" do 

            before { @user.password = @user.password_confirmation = "a" * 5 }
            
            it  "is invalid when the password is too short" do 
                expect(@user).to_not be_valid
            end 

        end 



        describe "the format validation of the email" do 

    		before{@user.email = "email@example..com" }

        	it "is valid when the format is correct" do 
        		expect(@user).to be_valid
        	end 

        end 


        describe "the uniqueness validation of the email" do 
        	before do 
        		user_with_same_email = @user.dup
        		user_with_same_email.save 
        	end 

        	it "is invalid when the email address is already taken" do 
    				expect(@user).to_not be_valid  
        	end 
	
        end 

	end 
