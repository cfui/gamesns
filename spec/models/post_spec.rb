require 'rails_helper'

RSpec.describe Post, type: :model do
  context "データが正しく保存されない" do
    before do
   	 @post = Post.new
   	 @post.postbody = ""
   	 @post.save
    end
    it "postbodyが入力されていないので保存されない" do
      expect(@post).to be_invalid
      expect(@post.errors[:postbody]).to include("can't be blank")
    end
  end
end
