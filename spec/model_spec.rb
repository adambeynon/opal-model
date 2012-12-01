require "spec_helper"

describe Opal::Model do
  describe "#initialize" do
    before do
      @klass = Class.new(Opal::Model)
    end

    it "with no attributes leaves all attributes as nil" do
      obj = @klass.new
      obj[:foo].should be_nil
      obj[:bar].should be_nil
      obj[:baz].should be_nil
    end

    it "sets given attributes" do
      obj = @klass.new foo: 'kapow'
      obj[:foo].should == 'kapow'
      obj[:bar].should be_nil
      obj[:baz].should be_nil
    end

    it "sets multiple given attributes" do
      obj = @klass.new foo: 'hello', bar: 'world'
      obj[:foo].should == 'hello'
      obj[:bar].should == 'world'
      obj[:baz].should be_nil
    end
  end
end
