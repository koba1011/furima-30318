class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC")
  end

  def favorites
    @items = current_user.favorite_items.includes(:user).order(created_at: :desc)
  end
end
