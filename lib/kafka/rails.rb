require 'poseidon'
module Kafka
  module Rails
    # Your code goes here...
    class << self
      attr_accessor :config_file

      def available_config_file
        config_file_path = Kafka::Rails.config_file || Rails.root.join("config", "kafka.yml")
        unless File.exists?(config_file_path)
          config_file_path = File.expand_path("../../generators/kafka/install/templates/config.yml", __FILE__)
        end
        config_file_path
      end
    end
  end

  class Consumer
    attr_accessor :consumer
    def initialize
      config_file = ::Kafka::Rails.available_config_file.to_s
      connection = self.class.connection.present? ? self.class.connection.to_s : :default
      config = YAML.load(ERB.new(IO.read(config_file)).result)[::Rails.env.to_s]["consumers"][connection.to_s]
      @consumer = ::Poseidon::PartitionConsumer.new(config["client_id"], #client
                                                    config["host"], # host
                                                    config["port"], # port
                                                    self.class.topic.to_s, # topic
                                                    config["partition"], # partition
                                                    config["strategy"].to_sym)
    end

    def run
      messages = consumer.fetch
      messages.each do |m|
        puts m.value
      end
    end

    class << self
      attr_accessor :topic, :connection
    end
  end

  class Producer
    attr_accessor :producer, :messages
    def initialize
      config_file = ::Kafka::Rails.available_config_file.to_s
      connection = self.class.connection.present? ? self.class.connection.to_s : :default
      config = YAML.load(ERB.new(IO.read(config_file)).result)[::Rails.env.to_s]["producers"][connection.to_s]
      @producer = Poseidon::Producer.new(["#{config["host"]}:#{config["port"]}"], config["client_id"])
    end

    def build_messages(msgs)
      @messages = []
      msgs.each do |msg|
        @messages << Poseidon::MessageToSend.new(self.class.topic.to_s, msg)
      end
      self
    end

    def deliver
      producer.send_messages(messages)
    end

    class << self
      attr_accessor :topic, :connection
    end
  end
end
