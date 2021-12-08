class UsersController < ApplicationController

  def show  
    render :show
  end

    def new
      user = User.new
      render :new
    end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = user.errors.full_message
      redirect_to new_user_url(user.id)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end
end
