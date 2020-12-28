class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :soldout_comment, only: :create
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item)
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show"
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id],item_id: params[:item_id])
    if comment.user.id != current_user.id
      redirect_to item_path(comment.item)
    end
    comment.destroy
    redirect_to item_path(comment.item)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def soldout_comment
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to item_path(@item)
    end
  end
end

