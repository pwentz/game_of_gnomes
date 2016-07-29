class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.new
    if @order.save
      @order.gnomes << Gnome.where(:id => session[:bucket].keys)
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    end
  end
end
