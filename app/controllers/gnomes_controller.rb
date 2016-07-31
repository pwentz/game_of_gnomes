class GnomesController < ApplicationController

  def index
    @gnomes = Gnome.all
  end

  def show
    @gnome = Gnome.find(params[:id])
  end
end
