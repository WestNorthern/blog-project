class PostsController < ApplicationController
  
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @user = current_user
    @posts = Post.all
    @post = Post.new
  end


  def new
    @post = Post.new
    @user = current_user 
  end


  # def create
  #   respond_to do |format|
  #     @user = current_user
  #     @post = @user.posts.create(post_params)
  #     format.js
  #   end
  # end

  def create

    @user = current_user
    @post = @user.posts.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'New recipe was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.js
      end
    end
  end


  # def create
  #   @user = current_user
  #   @post = @user.posts.create(post_params)
  #   redirect_to @post
  # end

  def show
    @recipe_author = current_user
    @user = current_user
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end


  private


  def post_params
    params.require(:post).permit(:title, :content, :avatar)
  end

  
end
