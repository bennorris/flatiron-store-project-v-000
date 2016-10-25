class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.find_by_id(params[:id])
  end


end
