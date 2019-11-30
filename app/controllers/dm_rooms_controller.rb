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
    room = DmRoom.create
    @entry1 = DmEntry.create(dm_room_id: room.id, enduser_id: current_enduser.id)
    @entry2 = DmEntry.create(params.require(:dm_entry).permit(:enduser_id, :dm_room_id).merge(dm_room_id: room.id))
    # 下にあるcreate_checkを行う為、自分のユーザーidと相手のユーザーidとルームidを保存する
    relation = Relation.create(enduser1_id: current_enduser.id, enduser2_id: params[:enduser_id], dm_room_id: room.id)
    redirect_to dm_room_path(room.id)
  end

  private

  def create_check
    # dmを送るボタンを押した時に部屋が作られた後、戻るをしてもう一度dmを送るボタンを押すと、部屋がまた作られてしまう事への対策
    # 自分のユーザーidと相手のユーザーidが一致したレコードを取ってくる。
    relation1 = Relation.find_by(enduser1_id: current_enduser.id , enduser2_id: params[:enduser_id])
    relation2 = Relation.find_by(enduser1_id: params[:enduser_id] , enduser2_id: current_enduser.id)
    # dm_roomが既にあれば、そのdm_roomへ飛ぶ
    if relation1
      redirect_to dm_room_path(relation1.dm_room_id)
    elsif relation2
      redirect_to dm_room_path(relation2.dm_room_id)
    end
  end

end
