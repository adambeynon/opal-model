module Opal
  class Column
    def initialize(name, default = nil)
      @name = name
      @default = type_cast(default)
    end

    def type_cast(value)
      value
    end

    class StringColumn < Column
    end
  end
end
