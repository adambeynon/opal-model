# opal-model

Client side models.

```ruby
class User < Opal::Model
  string :first_name
  string :last_name
  date :last_seen
end

john = User.new(first_name: 'John', last_name: 'Evans')
john.last_seen = Date.today
john.save
```

## Attributes

You can define attributes on a model subclass by one of the helper methods:

```ruby
class Dog < Opal::Model
  string :name
end
```

This defines an attribute `name` of type `String`. The full list of attribute
types are: `string`, `integer`, `float`, `boolean`, `date` and `time`. These
will each map internally to the instances of `String`, `Numeric`, `Numeric`,
`Boolean`, `Date` and `Time` respectively. Declaring the correct type is
crucial as attributes will be coerced when setting/getting or saving as json
to your server.

### Accessing attributes

Declaring an attribute will give you a getter/setter method for free:

```ruby
class User < Opal::Model
  string :name
end

user = User.new
user.name = 'Adam Beynon'
user.name # => "Adam Beynon"
```
You can also access attributes by name using `[]` or `[]=`:

```ruby
user = User.new
user[:name] # => nil
user[:name] = 'Adam'
user[:name] # => "Adam"
```
