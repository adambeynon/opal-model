require 'opal-spec'
require 'opal-model'

class SimpleModel < OpalModel::Base
    attribute :name
end

class AdvancedModel < OpalModel::Base
    primary_key :title
end

##
# associations

class Post < OpalModel::Base
  has_many :comments
end
