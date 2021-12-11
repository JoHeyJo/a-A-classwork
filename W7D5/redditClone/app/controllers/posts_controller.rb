class PostsController < ApplicationController
  
  def index 
    @posts = Post.all 
    render :index 
  end

  def show 
    @posts = Post.find(params[:id])
    render :show
  end 

  def new 
    @post = Post.new
    render :new 
  end 

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save 
      redirect_to post_url(@post.id)
    else  
      render :new 
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit 
  end

  def update 
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post.id)
    else  
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params

  end
end
