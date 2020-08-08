class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.new(price: Item.find(session[:id]).price)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def show
    @item = Item.find(params[:id])
    session[:id] = @item.id
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV[ "PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    
    Payjp::Charge.create(
      amount: Item.find(session[:id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

end
