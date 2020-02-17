class ItemsController < ApplicationController
  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入
  
  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to("/")
  end
end
