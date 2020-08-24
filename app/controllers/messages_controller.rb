class MessagesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @message = Message.new(message_params)
    if @message.save
      MessageChannel.broadcast_to(@item,  {content: @message, user: current_user})
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
