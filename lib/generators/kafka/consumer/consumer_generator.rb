module Kafka
  class ConsumerGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)

    def copy_consumer_file
      template "consumer.rb", "app/kafkas/consumers/#{class_name.underscore}_consumer.rb"
    end
  end
end
