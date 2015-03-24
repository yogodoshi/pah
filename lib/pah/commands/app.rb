require File.expand_path(File.join('..', '..', '..', 'lib', 'pah', 'version.rb'), File.dirname(__FILE__))

module Pah
  class Commands
    class App < Base

      def run(argv)
        puts "Creating a new rails app in #{argv[0]}".green
        exec build_rails_command(argv[0])
      end

      private
        def build_rails_command(app_name)
          parts = []
          parts << "rails _#{::Pah::RAILS_VERSION}_ new #{app_name} -T"
          parts << "-q" unless options[:verbose]
          parts << "-m #{template_path}"
          parts.join(" ")
        end

        def template_path
          File.expand_path(File.join('..', '..', '..', 'lib', 'pah', 'rails_template.rb'), File.dirname(__FILE__))
        end
    end
  end
end
