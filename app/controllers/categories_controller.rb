class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def create 
    category = Category.create(category_params)
    redirect_to category.post
  end
  

  def category_params
    params.require(:category).permit(:name, category_ids:[], categories_attributes: [:name])
  end
end