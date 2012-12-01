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
