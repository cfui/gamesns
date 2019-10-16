class PostController < ApplicationController
  def new
  	@post = Post.new
  	@posts = Post.all
    p @posts
    @enduser = current_enduser.enduser_gametags 
    #ログインしているユーザーの同じゲームタグを持っている他のユーザー一覧が[]に入る
    @taguser = []  

    @enduser.each do |enduser_gametag|
      @gametag = enduser_gametag.gametag
      @tag = EnduserGametag.where(gametag: @gametag)
    end

    #@tagの中身がある場合のみ実行する
    if @tag
      @tag.each do |tag|
        @taguser << tag.enduser
      end
    end

  end


  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
