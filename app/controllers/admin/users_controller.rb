class Admin::UsersController < Admin::BaseController
  def show
    @gnomes = Gnome.all
  end
end
