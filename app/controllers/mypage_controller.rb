class MypageController < ApplicationController
  before_action :set_parents

  #マイページ作成用indexアクション
  def index    
  end

  def destroy
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @likes = Favorite.where(user_id: @user.id)
  end

end
