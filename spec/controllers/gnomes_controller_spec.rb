require 'rails_helper'

describe GnomesController, :type => :controller do
  describe "GET #index" do
    it 'assigns @gnomes' do
      gnomes = create_list(:gnome, 2)
      get :index 

      expect(assigns(:gnomes)).to eq(gnomes)
    end

    it 'renders index view' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it 'assigns @gnome' do
      gnome = create(:gnome)
      get :show, id: gnome.id

      expect(assigns(:gnome)).to eq(gnome)
    end

    it 'renders show view' do
      gnome = create(:gnome)
      get :show, id: gnome.id

      expect(response).to render_template(:show)
    end
  end
end
