class UsersController < ApplicationController

  before_action :authenticate_user! 
  before_action :validate_user 


  def validate_user
    @user = current_user 
  end


  def show 
    @user_show = User.find(params[:id])
    @micropost = @user.microposts.build
    @microposts = @user_show.microposts.paginate(page: params[:page])
  end 


  def index
    @users = User.paginate(page: params[:page])
  end 


end
