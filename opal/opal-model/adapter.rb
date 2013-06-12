module OpalModel
  class Adapter

    def find(model, id, &block)
      implement "find"
    end

    def load(model, id, data)

    end

    def create_record(model)

    end

    def save_record(model)

    end

    def delete_record(model)

    end

    def implement(method)
      raise NoMethodError "Adapter subclass (#{self.inspect}) does not implement ##{method}"
    end
  end
end
