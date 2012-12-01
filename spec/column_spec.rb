require 'spec_helper'

describe Opal::Column do

end

describe Opal::Column::StringColumn do
  describe '#type_cast' do
    it "returns the given value" do
      Opal::Column::StringColumn.new(:foo).type_cast("bar").should == "bar"
    end
  end
end
