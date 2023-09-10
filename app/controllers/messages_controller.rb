class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    # @message = Message.new(message_params2)

    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  # def message_params2
  #   params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  # end
end
