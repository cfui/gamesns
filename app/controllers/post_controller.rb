class PostController < ApplicationController
  def new
  	@post = Post.new
  	@posts = Post.all
    @enduser = Enduser.find(current_enduser.id)
  end

  def create
  	@post = Post.new(post_params)
    @post.enduser_id = current_enduser.id
  	@post.save
  	redirect_to new_post_path
  end

  private

  def post_params
  	params.require(:post).permit(:postbody, :post_image)
  end
end
