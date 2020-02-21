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
    # @parents = Category.all.order("id ASC").limit(13)
    
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.id
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

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def back_index
    redirect_to action: :index unless user_signed_in?
  end
  
  # user_id,category_idは機能未実装のため仮の値をセットしている。
  def item_params
    params.require(:item).permit(:name, :price, :item_text, :address, :date, :brand, :status, :delivery_charge, :size, images_attributes: [:image]).merge(user_id: current_user.id, sold_out: 0,category_id: 1)
  end


  def item_params
    params.require(:item).permit(:name, :price, :item_text, :address, :date, :brand, :status, :delivery_charge, :size).merge(user_id: current_user.id, sold_out: 0, category_id: 1)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

end
