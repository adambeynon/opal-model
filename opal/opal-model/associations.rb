module OpalModel
  class Base

    def self.has_many(name)
      define_method(name) do
        unless array = instance_variable_get(name)
          array = RecordArray.new
          instance_variable_set name, array
        end

        array
      end

      define_method("#{name}=") do |ary|

      end
    end
  end
end
