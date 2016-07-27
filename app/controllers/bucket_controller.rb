class BucketController < ApplicationController
  def show
  end

  def update
    gnome = Gnome.find(params[:format])
    @bucket.adjust_gnome_quantity(params[:increase], params[:format])
    gnome_link = view_context.link_to(gnome.name, gnome_path(gnome))
    flash[:success] = %Q[Successfully removed <a href="/gnomes/#{gnome.id}">#{gnome.name}</a>]
    redirect_to bucket_path
  end
end
