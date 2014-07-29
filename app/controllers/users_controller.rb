class UsersController < ApplicationController
  
  def new
  	@user = User.new 
  end

  def show 
  	@user =User.find(params[:id])
    @micropost = @user.microposts.build
    @microposts = @user.microposts.paginate(page: params[:page])
  end 

  def create 
  	@user = User.new(user_params)

  	if @user.save 
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user 
  	else 
  		render 'new' 
  	end 
  end 

  def edit 
    @user = User.find(params[:id])
  end 

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit' 
    end 
  end 

  def index
    @users = User.paginate(page: params[:page])
  end 


  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User successfully deleted..."
    redirect_to users_url
  end 

  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password,:password_confirmation)
  	end


end
