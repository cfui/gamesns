class PostController < ApplicationController
  def new
    @posts = Post.all.page(params[:page])

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

      # 住所検索をする為、ログインしているユーザーの住所idを変数へ
      @user_address = current_enduser.address


      # タグが一致したユーザーidと全体のユーザーidを検索
      @user_tag = Enduser.where(id: @user_tags_ids) #自分と共通のタグを持っている人
      # 住所とタグが一致したユーザーのidを取得する
      @user_tag_address = @user_tag.where(address: @user_address)

      # ↑のままだと投稿が新着順で表示されず、ユーザー投稿順で表示されるのでpostモデルで検索
      @tag_posts = Post.where(enduser_id: @user_tag_address) #タグが一致したユーザーの投稿を出している
      @tag_posts = @tag_posts.page(params[:page])

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
  	if @post.save
  	  redirect_to new_post_path
    else
      flash[:notice] = 'エラー！投稿が空白です'
      redirect_to new_post_path
    end
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
