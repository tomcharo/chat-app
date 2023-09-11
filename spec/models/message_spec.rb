require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @message = FactoryBot.build(:message)
  end

  describe "メッセージ投稿" do
    context "メッセージ投稿できる場合" do
      it "content,imageが存在すれば保存できる" do
        expect(@message).to be_valid
      end
      it "contentが空でも保存できる" do
        @message.content = ""
        expect(@message).to be_valid
      end
      it "imageが空でも保存できる" do
        @message.image = nil
        expect(@message).to be_valid
      end
    end

    context "メッセージ投稿できない場合" do
      it "content,imageが空では保存できない" do
        @message.content = ""
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it "roomが紐付いてなければ保存できない" do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it "userが紐付いてなければ保村できない" do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
