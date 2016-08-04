class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(params[:id])
    render file: '/public/404' unless @category
  end
end
