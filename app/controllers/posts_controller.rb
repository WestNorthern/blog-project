class PostsController < ApplicationController
  
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @user = current_user
    @posts = Post.all
  end


  def new
    @post = Post.new
    @user = current_user 
  end


  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to @post
  end


  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post = Post.update(post_params)
    redirect_to @post
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end


  private


  def post_params
    params.require(:post).permit(:title, :content)
  end

  
end
