class OrdersController < ApplicationController
  def index
  end

  def create
    @order = current_user.orders.create
    OrderGnomeSynthesizer.generate_order_gnomes(session.to_hash)
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
