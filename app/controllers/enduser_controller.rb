class EnduserController < ApplicationController

  def show
  	@enduser = Enduser.find(params[:id])
    @posts = @enduser.posts
    @gametags = @enduser.enduser_gametags
    @room = DmRoom.new

    # DM機能
    @current_enduser_entry = DmEntry.where(enduser_id: current_enduser.id)
    @enduser_entry = DmEntry.where(enduser_id: @enduser.id)
    if @enduser.id == current_enduser.id
    else
      @current_enduser_entry.each do |cu|
        @enduser_entry.each do |u|
          if cu.dm_room_id == u.dm_room_id then
            @isRoom = true
            @roomId = cu.dm_room_id
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
    params.require(:enduser).permit(:nickname, :profile_text, :profile_image, enduser_gametags_attributes: [:id, :tag_name, :_destroy])
  end
end