class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入
  def edit
  end
  
  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
