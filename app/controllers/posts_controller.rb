class PostsController < ApplicationController
  
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
    @user_id = params[:user_id]
  end


  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to @post
  end


  def show
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
