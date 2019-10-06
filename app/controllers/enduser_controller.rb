class EnduserController < ApplicationController
  def index
  end

  def new
    @enduser = Enduser.new
  end

  def show
  	@enduser = Enduser.find(params[:id])
  end

  def edit
    @enduser = Enduser.find(params[:id])
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
    params.require(:enduser).permit(:nickname, :profile_text, :profile_image)
  end
end