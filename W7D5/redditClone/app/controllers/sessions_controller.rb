class SessionsController < ApplicationController
  before_action :require_logged_in, only:[:destroy]
  def new 
    @user = User.new 
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to user_url(@user.id)
    else  
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy 
    logout
    redirect_to new_session_url
    # same as render :new ? Ask TA later maybe
  end
end
