require 'rails_helper'

describe CategoriesController, :type => :controller do
  describe 'GET #show' do
    it 'assigns @category' do
      category = create(:category)

      get :show, id: category.name

      expect(assigns(:category)).to eq(category)
    end
  end
end
