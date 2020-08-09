class OrdersController < ApplicationController
  def index
  end

  def new
    @item = Item.find(params[:item_id])

    session[:id] = @item.id
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  

  private

  def order_params
    params.permit(:postal_cod, :shipment_id, :token, :cities, :address, :build_name, :phone_number,:item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    
    Payjp::Charge.create(
      amount: Item.find(session[:id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

end
