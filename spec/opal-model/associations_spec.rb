require 'spec_helper'

describe "Model.has_many" do

  let(:post) { Post.new }
  let(:comments) { post.comments }

  describe "reader method" do
    it "should define a reader method" do
      post.should respond_to(:comments)
    end

    it "returns an empty RecordArray" do
      comments.should eq([])
      (OpalModel::RecordArray === comments).should be_true
    end
  end

  describe "writer method" do
    it "should define a writer method" do
      post.should respond_to(:comments=)
    end
  end
end
