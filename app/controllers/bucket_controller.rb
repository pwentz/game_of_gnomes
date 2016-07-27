class BucketController < ApplicationController
  def show
    @bucket.contents
  end

  def update
    gnome = Gnome.find(params[:format])
    @bucket.reduce_gnome_quantity(gnome.id.to_s)
    gnome_link = view_context.link_to(gnome.name, gnome_path(gnome))
    flash[:success] = %Q[Successfully removed <a href="/gnomes/#{gnome.id}">#{gnome.name}</a>]
    redirect_to bucket_path(@bucket)
  end
end
