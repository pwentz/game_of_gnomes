class BucketGnomesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    gnome = Gnome.find(params[:gnome_id])
    @bucket.add_gnome(gnome)
    session[:bucket] = @bucket.contents
    flash[:notice] = "Added #{pluralize(1, gnome.name)} to your bucket."
    redirect_to gnome_path(gnome)
  end
end
