class UsersController < ApplicationController
  before_action :require_logged_in, only:[:destroy, :edit, :show, :update]

  def index 
    @users = User.all 
    render :index
  end 

  def show 
    @user = User.find(params[:id])
    render :show
  end
  
  #find returns undefined - breaks code
  #find_by returns nil if not found
  
  def new 
    @user = User.new 
    render :new
  end 

  def create 
    @user = User.new(user_params)
    if @user.save  
      redirect_to user_url(@user.id)
    else  
      render :new
    end
  end 

  def edit 
    @user = User.find(params[:id]) 
    render :edit
  end 

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user.id)
    else  
      redirect_to user_url(@user.id)
    end
  end

  def destroy 
    logout 
    redirect_to new_session_url
  end 

  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
