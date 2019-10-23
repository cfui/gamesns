require 'rails_helper'

RSpec.describe Enduser, type: :model do
  context "データが正しく保存されない" do
    factory "SS" do
      before(:each) do
   	    @enduser = create(:enduser)
    end
    it "nicknameが入力されていないので保存されない" do
      expect(@enduser).to be_invalid
      expect(@enduser.errors[:nickname]).to include("can't be blank")
    end
  end
end
