require 'poseidon'
module Kafka
  module Rails
    # Your code goes here...
    class << self
      attr_accessor :config_file
    end
  end

  class Consumer
    attr_accessor :consumer
    def initialize
      config_file = ::Rails.root.join("config", "kafka.yml").to_s
      unless File.exists?(config_file)
        config_file = File.expand_path("../../generators/kafka/install/templates/config.yml", __FILE__)
      end
      config = YAML.load(ERB.new(IO.read(config_file)).result)[::Rails.env.to_s]
      @consumer = ::Poseidon::PartitionConsumer.new(self.class.client.to_s, #client
                                                    config["host"], # host
                                                    config["port"], # port
                                                    self.class.topic.to_s, # topic
                                                    0, # partition
                                                    :earliest_offset)
    end

    def run
      loop do
        messages = consumer.fetch
        messages.each do |m|
          puts m.value
        end
      end
    end

    class << self
      attr_accessor :topic, :client
    end
  end

  class Producer
    attr_accessor :producer
    class << self
      attr_accessor :client
    end
  end
end
