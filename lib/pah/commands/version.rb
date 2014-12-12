require File.expand_path(File.join('..', '..', '..', 'lib', 'pah', 'version.rb'), File.dirname(__FILE__))

module Pah
  class Commands
    class Version < Base
      BANNER = <<-HEREDOC
Pah version: #{Pah::VERSION}
Rails version: #{Pah::RAILS_VERSION}
Ruby version: #{Pah::RUBY_VERSION}
      HEREDOC

      def run(*)
        puts BANNER
      end

    end
  end
end
