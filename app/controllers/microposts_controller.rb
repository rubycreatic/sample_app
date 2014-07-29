class MicropostsController < ApplicationController 

	def create 
		@user = User.find(params[:micropost][:user_id])
		@micropost = @user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created"
		else 
			flash[:danger] = "Error to create micropost"	

		end		

		redirect_to  user_path(@user)	
	
	end 

	def destroy 

		@micropost = Micropost.find(params[:id])
		@micropost.destroy
    	redirect_to root_path
	end 


	private

    	def micropost_params
      		params.require(:micropost).permit(:content , :user_id)
    	end
end 