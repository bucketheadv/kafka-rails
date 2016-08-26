module Kafka
  class InstallGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)
    def copy_install_files
      copy_file "config.yml", "config/kafka.yml"
      copy_file "initializer.rb", "config/initializers/#{class_name.underscore}.rb"
    end
  end
end
