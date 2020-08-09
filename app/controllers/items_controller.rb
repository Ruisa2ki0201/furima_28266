class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:error] = 'shared/error_messages'
      render :new
    end
  end

  def show
    @order = Order.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      flash.now[:error] = 'shared/error_messages'
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end

  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :genre_id, :status_id, :bunder_id, :shipment_id, :area_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
