module Opal
  class Model
    def self.add_column(attr_name, column_klass)
      columns[attr_name] = column_klass.new attr_name

      define_method(attr_name) { @attributes[attr_name] }
      define_method("#{attr_name}=") { |value| @attributes[attr_name] = value }
    end

    def self.boolean(attr_name)
      add_column attr_name, Column::BooleanColumn
    end

    def self.date(attr_name)
      add_column attr_name, Column::DateColumn
    end

    def self.float(attr_name)
      add_column attr_name, Column::FloatColumn
    end

    def self.integer(attr_name)
      add_column attr_name, Column::IntegerColumn
    end

    def self.string(attr_name)
      add_column attr_name, Column::StringColumn
    end

    def self.time(attr_name)
      add_column attr_name, Column::TimeColumn
    end

    def self.columns
      @columns ||= {}
    end

    def initialize(attributes = {})
      @attributes = {}
      @new_record = true

      self.attributes = attributes
    end

    def [](attr_name)
      @attributes[attr_name]
    end

    def attributes=(attributes)
      attributes.each do |attr_name, value|
        @attributes[attr_name] = value
      end
    end
  end
end
