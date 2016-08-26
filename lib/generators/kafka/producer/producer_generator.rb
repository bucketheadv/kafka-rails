module Kafka
  class ProducerGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)

    def copy_producer_file
      template "producer.rb", "app/kafkas/producers/#{class_name.underscore}_producer.rb"
    end
  end
end
