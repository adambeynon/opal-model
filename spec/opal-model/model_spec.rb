require 'spec_helper'

describe OpalModel::Base do
  describe ".new" do
    it "should set @new_record to true" do
      SimpleModel.new.new_record?.should be_true
    end
  end

  describe ".primary_key" do
    it "should have a default primary key" do
      SimpleModel.primary_key.should eq(:id)
    end

    it "should be changeable" do
      AdvancedModel.primary_key.should eq(:title)
    end
  end

  describe ".load" do
    it "raises an ArgumentError if no id present" do
      lambda {
        SimpleModel.load({})
      }.should raise_error(ArgumentError)
    end

    it "should be able to load models with own primary_key" do
      AdvancedModel.load(title: 100).should be_kind_of(AdvancedModel)
    end

    it "should set @new_record to false on the model" do
      model = SimpleModel.load(id: 42)
      model.new_record?.should be_false
    end

    it "should cache model" do
      SimpleModel[8].should be_nil
      model = SimpleModel.load(id: 8)
      SimpleModel[8].should eq(model)
    end

    it "should update existing models" do
      foo = SimpleModel.load(id: 9, name: 'Adam')
      bar = SimpleModel.load(id: 9, name: 'Beynon')
      foo.should equal(bar)
      foo.name.should eq("Beynon")
    end
  end

  describe ".load_json" do
    it "should load a model from native json/js object" do
      obj = `{"id": 13, "name": "Bob"}`
      model = SimpleModel.load_json obj
      model.id.should eq(13)
      model.name.should eq("Bob")
    end
  end

  describe ".cached_record" do
    it "returns a model by its id if cached" do
      timmy = SimpleModel.load(id: 33, name: 'Timmy')
      SimpleModel.cached_record(33).should eq(timmy)
    end
  end

  describe ".find" do
    describe "when passed an id" do
      it "returns cached models instantly" do
        SimpleModel.load(id: 37, name: 'Freddy')
        SimpleModel.find(37).name.should eq('Freddy')
      end
    end
  end
end
