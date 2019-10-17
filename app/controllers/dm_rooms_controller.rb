class DmRoomsController < ApplicationController
  before_action :authenticate_enduser!



  def show
    @room = DmRoom.find(params[:id])
    if DmEntry.where(enduser_id: current_enduser.id,dm_room_id: @room.id).present?
      @messages = @room.dm_messages
      @message = DmMessage.new
      @entries = @room.dm_entries
      # @enduser = @entries.enduser
    else
      @room = DmRoom.create
      @entry1 = DmEntry.create(dm_room_id: @room.id, enduser_id: current_enduser.id)
      @entry2 = DmEntry.create(params.require(:dm_entry).permit(:enduser_id, :dm_room_id).
        merge(dm_room_id: @room.id))
      redirect_to dm_room_path(@room.id)
    end
  end
end
