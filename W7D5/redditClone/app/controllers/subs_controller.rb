class SubsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update]
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
  
    if @sub.update(sub_params) && current_user.id == params[:sub][:moderator_id]
      redirect sub_url(@sub.id)
    else
      render :edit
    end
  end

  private
  def sub_params
    params.private(:sub).permit(:title, :description, :moderator_id)
  end
end
