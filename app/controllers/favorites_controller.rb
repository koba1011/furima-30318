class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite
  
  def create
    if @item.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    @favorite.destroy
  end

  private

  def set_favorite
    @item = Item.find(params[:item_id])
  end
end
