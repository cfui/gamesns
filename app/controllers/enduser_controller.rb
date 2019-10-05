class EnduserController < ApplicationController
  def index
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
end