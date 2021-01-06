class FavoritesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    if @item.user_id != current_user.id   # 自分の投稿以外にお気に入り登録が可能
      @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    @favorite.destroy
  end
end
