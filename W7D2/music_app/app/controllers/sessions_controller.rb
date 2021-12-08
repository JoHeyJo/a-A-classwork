class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(params[:user][:email], [:user][:password])
    if user
      login!(user)
      redirect_to user_url(user.id)
    else
      flash.new[:erros] = ['Invalid credentials!']
      render :new
    end
  end

  def session_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end
end
