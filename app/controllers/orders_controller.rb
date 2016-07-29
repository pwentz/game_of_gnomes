class OrdersController < ApplicationController
  def index
  end

  def create
    @order = current_user.orders.create
    @order.add_contents(session[:bucket])
    flash[:notice] = "Order was successfully placed."
    redirect_to orders_path
  end
end
