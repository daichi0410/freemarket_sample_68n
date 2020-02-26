class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :back_index, only: [:new, :edit, :destroy, :create, :update]
  # before_action :move_to_index, except: [:index, :new,:show, :search]

  def index
    @sales = Item.where(sold_out: 0).limit(3)
    @sold_outs= Item.where(sold_out: 1).limit(3)
    @parents = Category.all.order("id ASC").limit(13)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入

  def show
    @address = Item.find_by(prefecture_id: [@item.prefecture_id])

    @item = Item.find(params[:id])

    # 全ての画像を取得
    @imagesall = Image.where(item_id: [@item.id]).order("id ASC")
    # １番IDが若い画像を取得
    @images1 = Image.where(item_id: [@item.id]).order("id ASC").limit(1)
    # それ以外の紐づいている画像を取得
    @images2 = @imagesall.drop(1)

    # 状態を判定 string型だったので文字列で判定
    if @item.status == "1"
      @item_status = "新品、未使用品"
    elsif @item.status == "2"
      @item_status = "未使用品に近い"
    else
      @item_status = "未入力"
    end

    # 発送日までの日数を判定
    if @item.date == "0"
      @date = "1日〜2日で発送"
    elsif @item.date == "1"
      @date = "3日〜4日で発送"
    end

    # 配送料を判定(配送料を10%ととして計算)
    if @item.delivery_charge == 1
      @delivery_charge = (@item.price * 0.1).ceil
    elsif @item.delivery_charge == 2
      @delivery_charge = (@item.price * 0.1).ceil
    else
      @delivery_charge = "不明"
    end
  end



  def edit
    # @item = Item.find(params[:id])
    @category = Category.all.order("id ASC").limit(13) # categoryの親を取得
  end

  def update
    @item = Item.find(params[:id])
    @image = Image.new
    if @item.update(item_params)
      redirect_to item_path
      flash[:success] = "変更しました。"
    else
      flash[:danger] = "更新に失敗しました。"
      render :edit
    end
  end
  
  def new
    @item = Item.new
    @item.images.new
    @category = Category.all.order("id ASC").limit(13) # categoryの親を取得
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
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






  
  def search
    @Items = Item.search(params[:keyword])
  end

  def fav
    item = Item.find(params[:id])
    if item.favorited_by?(current_user)
      fav = current_user.favorites.find_by(item_id: item.id)
      fav.destroy
      render json: item.id
    else
      fav = current_user.favorites.new(item_id: item.id)
      fav.save
      render json: item.id
    end
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def back_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name,:price, :item_text, :prefecture_id, :date, :brand, :status, :delivery_charge, :size, :category_id,images_attributes:[:image,:id]).merge(user_id: current_user.id, sold_out: 0)
  end
  
end
