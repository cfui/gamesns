class DmRoomsController < ApplicationController
  before_action :authenticate_enduser!
  before_action :create_check, only: [:create]
  def index
    @currentEntries = current_enduser.dm_entries
    myRoomIds = []

    @currentEntries.each do |entry|
      myRoomIds << entry.dm_room.id
    end
    @anotherEntries = DmEntry.where(dm_room_id: myRoomIds).where('enduser_id != ?', current_enduser.id)
    @anotherEntries = @anotherEntries.page(params[:page])
  end


  def show
      @room = DmRoom.find(params[:id])
      DmEntry.where(enduser_id: current_enduser.id,dm_room_id: @room.id).present?
      @messages = @room.dm_messages.page(params[:page])
      @message = DmMessage.new
      @entries = @room.dm_entries
  end

  def create
    
    # if
    #   @currentRoom = current_enduser.dm_
    #   currentRoomId = []
    #   @currentRoom.each do |room|
    #     currentRoomId << room.dm_room.id
    #   en
    #   @roomId = DmRoom.where(dm_room_id: currentRoomId)where(enduser_id: current_enduser.id)
    #   redirect_to dm_room_path(@room.id)
    # end

      room = DmRoom.create
      @entry1 = DmEntry.create(dm_room_id: room.id, enduser_id: current_enduser.id)
      @entry2 = DmEntry.create(params.require(:dm_entry).permit(:enduser_id, :dm_room_id).merge(dm_room_id: room.id))
      relation = Relation.create(enduser1_id: current_enduser.id, enduser2_id: params[:enduser_id], dm_room_id: room.id)
      redirect_to dm_room_path(room.id)
  end

  private

  def create_check
    relation1 = Relation.find_by(enduser1_id: current_enduser.id , enduser2_id: params[:enduser_id])
    relation2 = Relation.find_by(enduser1_id: params[:enduser_id] , enduser2_id: current_enduser.id)
    if relation1
      redirect_to dm_room_path(relation1.dm_room_id)
    elsif relation2
      redirect_to dm_room_path(relation2.dm_room_id)
    end
  end

end
