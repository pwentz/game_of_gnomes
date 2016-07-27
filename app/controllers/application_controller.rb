class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_bucket

  def set_bucket
    @bucket = Bucket.new(session[:bucket])
  end
end
