<% module_namespacing do -%>
#
# Author: <%= ENV["USER"] %>
#
# Usage: Consumers::<%= class_name %>Consumer.new.run
#
class Consumers::<%= class_name %>Consumer < Kafka::Consumer
  # Which connection, from the config in kafka.yml, default is ':default'
  # self.connection = :default

  # Change it to real topic name
  self.topic = :<%= class_name.underscore %>

  def initialize
    super
  end

  # This method should be rewrite
  def run
    Thread.new do
      loop do
        messages = consumer.fetch
        messages.each do |m|
          puts m.value
        end
      end
    end
  end
end
<% end %>
