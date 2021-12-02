# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    users = User.all 
    render json: users 
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user 
  end

  def update
    user = User.find(params[:id])
    redirect_to user_url if user.update(user_params)
  end

  def destroy
    User.find(params[:id]).delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end