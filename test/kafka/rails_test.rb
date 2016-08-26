require 'test_helper'

class Kafka::Rails::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Kafka::Rails
  end
end
