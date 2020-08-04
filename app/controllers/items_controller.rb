class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:price,:genre_id,:status_id,:bunder_id,:shipment_id,:area_id,:image)
  end

end
