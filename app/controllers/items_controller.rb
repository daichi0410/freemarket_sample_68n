class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :back_index, only: [:new, :edit, :destroy, :create, :update]

  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入

  def show
    @address = Address.find(prefecture_id: [@item.address])
    @image = Image.find_by(item_id: 17)
  end

  def new
    @item = Item.new
    @item.images.new
  end

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

  def back_index
    redirect_to action: :index unless user_signed_in?
  end

end
