<% module_namespacing do -%>
class <%= class_name %>Consumer < Kafka::Consumer
  self.topic = :<%= class_name.underscore %>
  # This method should be rewrite
  def run
    super
  end
end
<% end %>
