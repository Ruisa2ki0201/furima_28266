class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
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

  private

  def item_params
    params.require(:item).permit(:name,:text,:price,:genre_id,:status_id,:bunder_id,:shipment_id,:area_id,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end

end
