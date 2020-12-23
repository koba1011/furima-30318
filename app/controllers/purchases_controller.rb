class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
    if @item.user_id == current_user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
