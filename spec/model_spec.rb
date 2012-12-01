require "spec_helper"

describe Opal::Model do
  describe ".add_column" do
    before do
      @klass = Class.new(Opal::Model) do
        add_column :foo, Opal::Column
      end
    end

    it "creates a getter and setter method for the column name" do
      @klass.new.respond_to?(:foo).should be_true
      @klass.new.respond_to?(:foo=).should be_true
    end

    it "uses the defined setter to set the attribute" do
      model = @klass.new
      model.foo = 'hello'
      model.foo.should == 'hello'
      model.foo = 'world'
      model.foo.should == 'world'
    end
  end

  describe ".string" do
    it "creates a StringColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { string :user_name }
      klass.columns[:user_name].should be_kind_of(Opal::Column::StringColumn)
    end
  end

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
