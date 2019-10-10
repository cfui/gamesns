class PostCommentsController < ApplicationController
  def new
  	@post = post.find(params[:id])
  	@post_comment = PostComment.new
  end

  def create
  end
end
