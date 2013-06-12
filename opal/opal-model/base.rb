module OpalModel
  class Base
    def self.attributes(*attrs)
      attrs.each { |name| attribute name }
    end

    def self.attribute attr_name
      columns << attr_name
      attr_accessor attr_name
    end

    def self.columns
      @columns ||= []
    end

    # Return an array of all models
    def self.all
      identity_map.values
    end

    def self.adapter(klass)
      @adapter = klass.new
    end

    def self.get_adapter
      @adapter || raise("No adapter defined for #{self}")
    end

    def self.find(id = nil)
      if id
        cached_record(id)
      else
        raise "Must pass something to .find()"
      end
    end

    def self.load(attributes)
      raise ArgumentError, "no id (#{primary_key}) given" unless attributes[primary_key]

      if model = self[attributes[primary_key]]
        model.attributes = attributes
      else
        model = self.new attributes
        identity_map[model.id] = model
      end

      model.instance_variable_set :@new_record, false
      model
    end

    def self.load_json(json)
      load Hash.new json
    end

    def self.primary_key(primary_key = nil)
      primary_key ? @primary_key = primary_key : @primary_key ||= :id
    end

    primary_key :id

    attr_accessor :id

    def self.identity_map
      @identity_map ||= {}
    end

    def self.cached_record(id)
      @identity_map ||= {}
      @identity_map[id]
    end

    def self.[](id)
      cached_record id
    end

    def initialize(attrs={})
      @new_record = true
      self.attributes = attrs
    end

    def [](column)
      __send__(column)
    end

    def []=(column, value)
      __send__("#{column}=", value)
    end

    def new_record?
      @new_record
    end

    def as_json
      json = {}

      self.class.columns.each do |column|
        json[column] = __send__(column).as_json
      end

      json
    end

    def to_json
      as_json.to_json
    end

    def attributes=(attrs)
      attrs.each do |name, value|
        setter = "#{name}="
        if respond_to? setter
          __send__ setter, value
        else
          instance_variable_set "@#{name}", value
        end
      end
    end

    def save(&block)
      adapter = self.class.get_adapter

      if @new_record
        adapter.create_record self, &block
      else
        adapter.update_record self, &block
      end
    end

    def destroy(&block)
      adapter = self.class.get_adapter
      adapter.update_record self, &block
    end
  end
end
