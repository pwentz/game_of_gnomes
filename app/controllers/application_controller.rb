class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_categories
  before_action :set_bucket

  def set_bucket
    @bucket = Bucket.new(session[:bucket])
  end

  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def get_categories
    @categories = Category.all
  end
end
