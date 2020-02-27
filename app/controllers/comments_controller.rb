class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    item = Item.find(params[:item_id])
    if comment.save
      flash[:success] = "コメントしました"
    else
      flash[:success] = "コメントできませんでした"
    end
    redirect_to item_path(item.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
