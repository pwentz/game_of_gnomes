class Admin::UsersController < Admin::BaseController
  def show
    @gnomes = Gnome.all
    @top_three_orders = current_user.orders.first(3) unless current_user.orders.empty?
  end
end
