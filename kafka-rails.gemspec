$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kafka/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kafka-rails"
  s.version     = Kafka::Rails::VERSION
  s.authors     = ["sven"]
  s.email       = ["sven199109@gmail.com"]
  s.homepage    = "https://github.com/sven199109/kafka-rails"
  s.summary     = "Use kafka in rails."
  s.description = "Use kafka in rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "poseidon"

  s.add_development_dependency "sqlite3"
end
