class CategoriesController < ApplicationController

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: [@category.id])
  end
end
