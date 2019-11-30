class EnduserController < ApplicationController

  def show
  	@enduser = Enduser.find(params[:id])
    @posts = @enduser.posts.page(params[:page])
    @gametags = @enduser.enduser_gametags
    
# 　　DM機能
    @room = DmRoom.new
    # ---dmroomが作成された時に自分のユーザーidと相手のユーザーidをentriesに記録する為,検索---
    @current_enduser_entry = DmEntry.where(enduser_id: current_enduser.id)
    @enduser_entry = DmEntry.where(enduser_id: @enduser.id)
    if @enduser.id == current_enduser.id
    else
      @current_enduser_entry.each do |currentuser|
        @enduser_entry.each do |user|
          if currentuser.dm_room_id == user.dm_room_id then
            # isRoom=trueと書いたのは、これがfalseだった場合に、dmroomを作成する条件分岐を書く為
            @isRoom = true
            @roomId = currentuser.dm_room_id
          end
        end
      end
      if@isRoom
      else
        @entry = DmEntry.new
      end
    end
  end

  def edit
    @enduser = Enduser.find(params[:id])
    if @enduser != current_enduser
      redirect_to edit_enduser_path(current_enduser.id)
    end
  end

  def destroy
    enduser = Enduser.find(params[:id])
    enduser.destroy
    redirect_to admin_index_path
  end

  def update
    @enduser = Enduser.find(params[:id])
    if @enduser.update(enduser_params)
      redirect_to enduser_path(current_enduser.id)
    else
      flash[:notice] = 'エラー！空白の欄があります'
      redirect_to edit_enduser_path(current_enduser.id)
    end
  end


  private
  def enduser_params
    params.require(:enduser).permit(:nickname, :address, :profile_text, :profile_image, enduser_gametags_attributes: [:id, :tag_name, :_destroy])
  end
end