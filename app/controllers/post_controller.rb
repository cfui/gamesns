class PostController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @gametag = current_enduser.enduser_gametags
    @user= current_enduser.id

    # -------タグ機能開始-------

    # ログインユーザーがどんなタグを持っているか検索
    @enduser_tags = EnduserGametag.where(enduser_id: current_enduser)
    #↑配列になっていて取り出せない為,箱を用意
    @enduser_tagnames = []
    @enduser_tags.each do |enduser_tag|
      @enduser_tagnames << enduser_tag.tag_name
    end

    # 全体のタグと自分のタグを検索
    @user_tags = EnduserGametag.where(tag_name: @enduser_tagnames)
    @user_tags_ids = []
    # タグが一致したユーザーidを取得
    @user_tags.each do |u|
      @user_tags_ids << u.enduser_id
    end

    # タグが一致したユーザーidと全体のユーザーidを検索
    @user_a = Enduser.where(id: @user_tags_ids) #自分と共通のタグを持っている人
    # タグが一致したユーザーと全体のユーザーidを検索
    @tag_posts = Post.where(enduser_id: @user_a) #タグが一致したユーザーのタグを出している
   end

   # ----------タグ機能終了----------




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
