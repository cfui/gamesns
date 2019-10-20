class PostCommentsController < ApplicationController
  def new
  	@post = post.find(params[:id])
  	@post_comment = PostComment.new
  end

  def show
  	@posts = Post.find(params[:id])
  end

  def create
  	post = Post.find(params[:post_id])
  	comment = current_enduser.post_comments.new(post_comment_params)
  	comment.post_id = post.id
  	comment.save
  	redirect_to post_path(post)
  end



  private
  def post_comment_params
  	params.require(:post_comment).permit(:enduser_id, :post_id, :comment)
  end
end
