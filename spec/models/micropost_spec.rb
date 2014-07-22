require 'rails_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  let(:user_b) {FactoryGirl.create(:user)}

  before do
    @micropost = user.microposts.build(content: "Lorem ipsum")
  end

  describe "micropost fields" do 
  
    it "should have a content field" do 
    	expect(@micropost).to respond_to(:content)
    end 

    it "should have a user_id field" do 
    	expect(@micropost).to respond_to(:user_id)
    end 

    it "should belongs to user" do 
      expect(@micropost).to respond_to(:user)
    end 
  
  end 


  describe "The presence of a user relation with a micropost" do
   
    before { @micropost.user_id = nil }

    it "is invalid without a user_id" do 
      expect(@micropost).to_not be_valid 
    end 
  
  end


  describe "order of microposts to display in  screen" do 
    
    before { user_b.save }

    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: user_b, created_at: 1.day.ago)
    end
    
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: user_b, created_at: 1.hour.ago)
    end

    it "is valid when micropost order is newest first" do
      expect(user_b.microposts.to_a).to eq [newer_micropost, older_micropost]
    end

  end 


  describe "destroys  user also destroys micropost" do 

    it " is valid when both user and the micropost are destroyed" do
      microposts = user.microposts.to_a
      user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
    end

  end 

  describe "presence validation and length validation" do 

    describe "the presence of the content" do
      before { @micropost.content = " " }
      it "is invalid when the content is empty" do 
        expect(@micropost).to_not be_valid
      end 
    end

    describe "the length of the content" do
      before { @micropost.content = "a" * 141 }
      it "it is invalid when the content is too long" do
        expect(@micropost).to_not be_valid  
      end  
    end

  end 



end

