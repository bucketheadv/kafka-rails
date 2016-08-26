# Kafka::Rails
This is a gem to integrate kafka in rails.

## Usage

```bash
rails g kafka:install kafka-rails
```

It will generate 2 files: `config/kafka.yml`, `config/initializers/kafka_rails.rb`.

```bash
rails g kafka:consumer users
```

It will generate the file: `app/kafkas/consumers/users_consumer.rb`.

```bash
rails g kafka:producer users
```

It will generate the file: `app/kafkas/producers/users_producer.rb`.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'kafka-rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install kafka-rails
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
