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
    if @user.save
      flash[:notice] = 'Your account was successfully created'
      redirect_to @user
    else
      flash[:alert] = 'Your account did not get created'
      redirect_to new_user_path
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def edit
    @update_welcome = 'You have accessed the update page'
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    redirect_to @user

  end


  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end


  private


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end