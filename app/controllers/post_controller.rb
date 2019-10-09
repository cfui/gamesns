class PostController < ApplicationController
  def new
  	@post = Post.new
  	@posts = Post.all
    @tag = Enduser.find(params[:enduser_gametag_id][:enduser])

    if @tag

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
