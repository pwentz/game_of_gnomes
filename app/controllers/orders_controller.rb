class OrdersController < ApplicationController
  def index
  end

  def create
    @order = current_user.orders.create
    @order.add_contents(session[:bucket])
    flash[:notice] = "Order was successfully placed."
    redirect_to orders_path
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  # def update
  #   # change status enum - see controller
      # timestamp
  # end
end
