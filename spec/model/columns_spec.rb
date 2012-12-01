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

  describe ".boolean" do
    it "creates a BooleanColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { boolean :logged_in }
      klass.columns[:logged_in].should be_kind_of(Opal::Column::BooleanColumn)
    end
  end

  describe ".date" do
    it "creates a DateColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { date :last_seen }
      klass.columns[:last_seen].should be_kind_of(Opal::Column::DateColumn)
    end
  end

  describe ".float" do
    it "creates a FloatColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { float :distance }
      klass.columns[:distance].should be_kind_of(Opal::Column::FloatColumn)
    end
  end

  describe ".integer" do
    it "creates an IntegerColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { integer :post_count }
      klass.columns[:post_count].should be_kind_of(Opal::Column::IntegerColumn)
    end
  end

  describe ".string" do
    it "creates a StringColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { string :user_name }
      klass.columns[:user_name].should be_kind_of(Opal::Column::StringColumn)
    end
  end

  describe ".time" do
    it "creates a TimeColumn for the given attribute name" do
      klass = Class.new(Opal::Model) { time :joined_at }
      klass.columns[:joined_at].should be_kind_of(Opal::Column::TimeColumn)
    end
  end
end
