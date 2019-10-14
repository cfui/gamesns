class DmMessagesController < ApplicationController
  before_action :authenticate_enduser!, only: [:create]


  def create 
  	if DmEntry.where(enduser_id: current_enduser.id, dm_room_id: params[:dm_message][:dm_room_id]).present?
  	  @message = DmMessage.new(dm_message_params)
  	  @message.enduser_id = current_enduser.id
  	  @message.save
  	else
  	  flash[:alert] = "メッセージ送信に失敗しました。"
  	end
  	redirect_back(fallback_location: new_post_path)
  end

  
  private
    def dm_message_params
      @message =params.require(:dm_message).permit(:enduser_id, :content, :dm_room_id)
    end
end
