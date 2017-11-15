class UsersController < ApplicationController


  before_action :authenticate, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end


  def new
    @user = User.new
  end


  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end


  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    p user_params
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user

  end


  def destroy
    respond_to do |format|
      User.find(params[:id]).destroy
      format.js
      # format.html { redirect_to users_path }
      
    end
    
    session[:user_id] = nil
  end


  private


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :bio)
  end

end