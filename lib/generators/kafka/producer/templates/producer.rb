<% module_namespacing do -%>
#
#  Author: <%= ENV["USER"] %>
#
#  Usage: Producers::<%= class_name %>Producer.new.build_messages(['msg1', 'msg2']).deliver
#
class Producers::<%= class_name %>Producer < Kafka::Producer
  # Which connection, from the config in kafka.yml, default is ':default'
  # self.connection = :default

  # Change it to real topic name
  self.topic = :<%= class_name.underscore %>

  def initialize
    super
  end

  #
  # @param [Array] msgs
  #
  # @return [Producers::<%= class_name %>Producer] self
  #
  def build_messages(msgs)
    super(msgs)
  end

  def deliver
    super
  end
end
<% end -%>
