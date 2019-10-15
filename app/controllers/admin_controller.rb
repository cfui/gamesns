class AdminController < ApplicationController
  def index
  	@q = Enduser.ransack(params[:q])
  	@endusers = @q.result(distinct: true)
  end

  def show
  end
end
