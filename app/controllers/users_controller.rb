class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{current_user.username}."
      redirect_to dashboard_path
    else
      flash[:notice] = "Account creation failed. Try again."
      redirect_to login_path
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
