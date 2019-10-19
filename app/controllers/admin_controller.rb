class AdminController < ApplicationController
  def index
  	@q = Enduser.ransack(params[:q])
  	@endusers = @q.result(distinct: true)
  	# @enduser = Enduser.find(params[:id])
  end

end
