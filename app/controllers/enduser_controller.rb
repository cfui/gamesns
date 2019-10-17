class EnduserController < ApplicationController
  def index
  end

  def new
    @enduser = Enduser.new
  end

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
    @enduser.enduser_gametags.build
  end

  def destroy
  	session[:enduser_mail] = nil
  	redirect_to "/post/new"
  end

  def update
    @enduser = Enduser.find(params[:id])
    @enduser.update(enduser_params)
    redirect_to enduser_path(@enduser.id)
  end

  def dm
  end



  private
  def enduser_params
    params.require(:enduser).permit(:nickname, :profile_text, :profile_image, enduser_gametags_attributes: [:id, :tag_name, :_destroy])
  end
end