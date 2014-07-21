require 'rails_helper'

	describe User do 

		before { @user = User.new(name: "Example User" , email: "user@example.com" , password: "hola_mundo" , password_confirmation: "hola_mundo")}

		describe "User fields" do 

    		it "should have valid name" do 
          		expect(@user).to respond_to(:name)
        	end 

        	it "should have valid email" do 
          		expect(@user).to respond_to(:email)
        	end 

            it "should have valid password" do 
                expect(@user).to respond_to(:password_digest)
            end 

            it "should have a valid password confirmation" do 
                expect(@user).to respond_to(:password_confirmation)
            end 

        end 

        describe "The presence of the field name" do 
        
        	before{@user.name = ""}
        	
        	it "should be false" do 
        		expect(@user).to_not be_valid
        	end
        
        end 


        describe "The presence of the field email" do

        	before{@user.email = ""}

        	it "should be false" do 
        		expect(@user).to_not be_valid
        	end 

        end 

        describe "when the name is too long" do 

        	before{@user.name = "a" * 51}

        	it "should be false" do 
        		expect(@user).to_not be_valid 
        	end 

        end 

        describe "valid email format" do 

    		before{@user.email = "email@example..com" }

        	it "should be true" do 
        		expect(@user).to be_valid
        	end 

        end 


        describe "when the email address is already taken" do 
        	before do 
        		user_with_same_email = @user.dup
        		user_with_same_email.save 
        	end 

        	it "should be false" do 
    				expect(@user).to_not be_valid  
        	end 
	
        end 


        describe "when the password field is not present" do 
            before do 
                @user.password = ""
                @user.password_confirmation = ""
            end 

            it "should not be valid" do 
                expect(@user).to_not be_valid  
            end 
    
        end 


        describe "validates password length" do 

            before { @user.password = @user.password_confirmation = "a" * 5 }
            it  "should not be valid" do 
                expect(@user).to_not be_valid
            end 

        end 




        describe "validates user authenticate methods" do

            before { @user.save }
            let(:found_user) { User.find_by(email: @user.email) }

            describe "the user has a  valid password" do

                it "should  be  valid" do 
                    expect(@user).to eq(found_user.authenticate(@user.password))
                end
            end 

            describe "the user does not have a valid password" do
            
                let(:user_for_invalid_password) { found_user.authenticate("invalid") }

                it "should not be valid" do 
                    expect(@user).to_not eq(user_for_invalid_password)
                    
                end 
            end

        end


	end 
