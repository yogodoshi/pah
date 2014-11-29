require File.expand_path(File.join('..', '..', '..', 'lib', 'pah', 'version.rb'), File.dirname(__FILE__))

module Pah
  class Commands
    class App

      def run(argv)
        template_rb = File.expand_path(File.join('..', '..', '..', 'lib', 'pah', 'rails_template.rb'), File.dirname(__FILE__))
        exec "rails _#{::Pah::RAILS_VERSION}_ new #{argv[0]} -T -m #{template_rb}"
      end

    end
  end
end
