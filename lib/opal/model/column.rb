module Opal
  class Column
    def initialize(name, default = nil)
      @name = name
      @default = type_cast(default)
    end

    def type_cast(value)
      value
    end

    class BooleanColumn < Column
    end

    class DateColumn < Column
    end

    class FloatColumn < Column
    end

    class IntegerColumn < Column
    end

    class StringColumn < Column
    end

    class TimeColumn < Column
    end
  end
end
