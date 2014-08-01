class MicropostsController < ApplicationController 

  before_action :authenticate_user! 
  before_action :validate_user 

	def validate_user
    	@user = current_user 
  	end

	def index
		@microposts = Micropost.all.paginate(page: params[:page]) 
	end 


	def create 
		@micropost = @user.microposts.build(micropost_params)
		if @micropost.save
			flash[:notice] = "Micropost created"
		else 
			flash[:notice] = "Error to create micropost"	

		end		

		redirect_to  user_path(@user)	
	
	end 

	def destroy 

		@micropost = Micropost.find(params[:id])
		if @micropost.destroy
    		flash[:notice] = "Micropost deleted"
    	else 
    		flash[:notice] = "Error to delete micropost"
    	end 
    	
    	redirect_to user_path(@user)
	end 


	private

    	def micropost_params
      		params.require(:micropost).permit(:content , :user_id)
    	end
end 