require 'rails_helper'

describe OrdersController, :type => :controller do
  describe 'GET #index' do
    it 'renders index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    it 'creates the order' do
      user = create(:user)
      session[:user_id] = user.id
      session[:bucket] = {}
      post :create, order: attributes_for(:order)
      expect(Order.count).to eq(1)
    end

    it 'flashes success notice' do
      user = create(:user)
      session[:user_id] = user.id
      session[:bucket] = {}
      post :create, order: attributes_for(:order)

      expect(controller).to set_flash.to("Order was successfully placed.")
    end

    it 'redirects to orders index' do
      user = create(:user)
      session[:user_id] = user.id
      session[:bucket] = {}
      post :create, order: attributes_for(:order)

      expect(response).to redirect_to(orders_path)
    end
  end

  describe 'GET #show' do
    it 'assigns @order' do
      user = create(:user)
      order = create(:order, :user => user)
      session[:user_id] = user.id
      session[:bucket] = {}
      get :show, id: order.id

      expect(assigns(:order)).to eq(order)
    end

    it 'renders show page' do
      user = create(:user)
      order = create(:order, :user => user)
      session[:user_id] = user.id
      get :show, id: order.id

      expect(response).to render_template(:show)
    end
  end
end
