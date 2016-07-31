class UsersController < ApplicationController
  before_action :require_current_user, only: [:show, :update]

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
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end

  def require_current_user
    render file: "/public/404" unless current_user?
  end

  def current_user?
    current_user && current_user.default?
  end
end
