class SubsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update]
  before_action :is_mod?, only:[:edit, :update]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params) #&& current_user.id == @sub.moderator_id
      redirect sub_url(@sub.id)
    else
      render :edit
    end
  end

  def is_mod?
    current_user.id == params[:moderator_id]
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
