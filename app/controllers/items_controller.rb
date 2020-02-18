class ItemsController < ApplicationController
  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
  end

  def show
    
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入
  def edit
  end
  
end
