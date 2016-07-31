class BucketGnomesController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :fetch_gnome, :only => [:update, :destroy]

  def create
    gnome = Gnome.find(params[:gnome_id])
    @bucket.add_gnome(gnome)
    session[:bucket] = @bucket.contents
    flash[:notice] = "Added #{pluralize(@bucket.contents[gnome.id.to_s], gnome.name)} to your bucket."
    redirect_to gnome_path(gnome)
  end

  def update
    bucket_gnome = BucketGnome.new(@gnome.id)
    bucket_gnome.adjust_quantity(params[:adjustment], @bucket)
    redirect_to bucket_path
  end

  def destroy
    @bucket.contents.delete(params[:id])
    flash[:success] = %Q[Successfully removed <a href="/gnomes/#{@gnome.id}">#{@gnome.name}</a>]
    redirect_to bucket_path
  end

  private

  def fetch_gnome
    @gnome = Gnome.find(params[:id])
  end
end
