class SessionsController < ApplicationController
  def index
  end

  #shows the login form
  def new
    #nothing has to be in here
  end

  def create
    @user = User.find_by(session_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = 'Your email and password are incorrect'
      redirect_to new_session_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end

  def show
  end

  private

  def session_params
    params.require(:login).permit(:email, :password)
  end

end
