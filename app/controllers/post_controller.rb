class PostController < ApplicationController
  def new
    @posts = Post.all.order(created_at: :desc)
    if enduser_signed_in?
      @post = Post.new
      @user= current_enduser.id


      # -------タグ機能-------
      # ログインユーザーがどんなタグを持っているか検索
      @enduser_tags = EnduserGametag.where(enduser_id: current_enduser)
      #↑配列になっていて取り出せない為,箱を用意
      @enduser_tagnames = []
      # whereで取ったきたレコードからtag_nameを取り出す
      @enduser_tags.each do |enduser_tag|
        @enduser_tagnames << enduser_tag.tag_name
      end

      # 全体のタグと自分のタグを検索
      @user_tags = EnduserGametag.where(tag_name: @enduser_tagnames)
      @user_tags_ids = []
      # タグが一致したユーザーidを取得
      @user_tags.each do |tag|
        @user_tags_ids << tag.enduser_id
      end

      # タグが一致したユーザーidと全体のユーザーidを検索
      @user_tag = Enduser.where(id: @user_tags_ids) #自分と共通のタグを持っている人
      # ↑のままだと投稿がうまく表示できないので、まずタグが一致したユーザーと全体のユーザーidを検索
      @tag_posts = Post.where(enduser_id: @user_tag) #タグが一致したユーザーの投稿を出している

     # ----------タグ機能終了----------
    else
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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to enduser_path(current_enduser.id)
  end

  private

  def post_params
  	params.require(:post).permit(:postbody, :post_image)
  end
end
