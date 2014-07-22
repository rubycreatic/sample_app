require 'rails_helper'
=begin 
describe Micropost do

  let(:user) { FactoryGirl.create(:user) }

  describe "valid content and user micropost" do 
  
    before do
      @micropost = user.microposts.build(content: "Lorem ipsum")
    end

    it "should have a valid content" do 
    	expect(@micropost).to respond_to(:content)
    end 

    it "should have a valid user" do 
    	expect(@micropost).to respond_to(:user)
    end 

    it "should have a valid user_id" do 
    	expect(@micropost).to respond_to(:user_id)
    end 

    describe "with blank content" do
      before { @micropost.content = " " }
      it "should not be valid" do 
        expect(@micropost).to_not be_valid
      end 
    end

    describe "with content that is too long" do
      before { @micropost.content = "a" * 141 }
      it "should not be valid" do
        expect(@micropost).to_not be_valid  
      end  
    end


    describe "when user_id is not present" do
     
      before { @micropost.user_id = nil }

      it "should not be valid" do 
      	expect(@micropost).to_not be_valid 
      end 
    
    end

  end 

  describe "micropost associations" do 
    before { user.save }

    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: user, created_at: 1.day.ago)
    end
    
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      expect(user.microposts.to_a).to eq [newer_micropost, older_micropost]
    end


    it "should destroy associated microposts" do
      microposts = user.microposts.to_a
      user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
    end

  end 




end
=end 
