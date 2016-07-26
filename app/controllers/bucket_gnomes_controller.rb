class BucketGnomesController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    gnome = Gnome.find(params[:gnome_id])
    bucket = session[:bucket] || {}
    bucket[gnome.id] ||= 0
    bucket[gnome.id] += 1
    session[:bucket] = bucket
    flash[:notice] = "Added #{pluralize(1, gnome.name)} to your bucket."
    redirect_to gnomes_path
  end
end
