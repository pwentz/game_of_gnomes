class GnomesController < ApplicationController

  def index
  end

  def show
    @gnome = Gnome.find(params[:id])
  end
end
