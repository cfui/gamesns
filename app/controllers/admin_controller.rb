class AdminController < ApplicationController
  def index
  	@q = Enduser.ransack(params[:q])
  	@endusers = @q.result(distinct: true)
  	# @enduser = Enduser.find(params[:id])
  end

  def destroy
  	enduser = Enduser.find(params[:id])
    enduser.destroy
    redirect_to admin_index_path
  end
end
