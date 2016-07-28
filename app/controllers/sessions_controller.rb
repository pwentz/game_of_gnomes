class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to dashboard_path
    else
      flash[:danger] = "Invalid login!"
      render :new
    end
  end

end
