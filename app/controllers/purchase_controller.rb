class PurchaseController < ApplicationController
  require 'payjp'

  def index 
    @card = Card.where(user_id: current_user.id).first
    @item = Item.find(params[:item_id])
    @total_price = (@item.price * 1.1 + @item.price * 0.1).ceil
    @images1 = Image.where(item_id: [@item.id]).order("id ASC").limit(1)
    @user = User.find_by(id: current_user.id)
    @user_address = @user.address.prefectures + @user.address.municipality + @user.address.number + @user.address.details

    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @images1 = Image.where(item_id: [@item.id]).order("id ASC").limit(1)

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => (@item.price * 1.1 + @item.price * 0.1).ceil,
    :customer => card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:item_id])
    @images1 = Image.where(item_id: [@item.id]).order("id ASC").limit(1)
  end
end