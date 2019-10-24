class AdminController < ApplicationController
  def index
  	@enduser = Enduser.ransack(params[:q])
  	@endusers = @enduser.result(distinct: true)
  	@endusers = @endusers.page(params[:page])
  end

end
