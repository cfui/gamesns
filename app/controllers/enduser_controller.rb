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
  end

  def destroy
  	session[:enduser_mail] = nil
  	redirect_to "/post/new"
  end

  def dm
  end

  private
  def enduser_params
    params.require(:endouser).permit(:nickname)
  end
end