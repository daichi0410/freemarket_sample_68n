class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :back_index, only: [:new, :edit, :destroy, :create, :update]

  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
    @parents = Category.all.order("id ASC").limit(13)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入

  def show
    # @address = Address.find(prefecture_id: [@item.address])
    @image = Image.find_by(item_id: 17)
  end


  def edit
  end

  def update
  end
  
  def new
    @item = Item.new
    # @item.images.new
    @category = Category.all.order("id ASC").limit(13) # categoryの親を取得
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  

  def destroy
    @item.destroy
    redirect_to root_path
  end


  def category_children  
    @category_children = Category.find(params[:productcategory]).children 
  end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで孫を取得｡（実際には子カテゴリーの子になる｡childrenは子を取得するメソッド)

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def back_index
    redirect_to action: :index unless user_signed_in?
  end


  def item_params
    params.require(:item).permit(:name, :price, :item_text, :address, :date, :brand, :status, :delivery_charge, :size, :category_id).merge(user_id: current_user.id, sold_out: 0)
  end

  # --------------------------------------------------------------------------------
  
# end
