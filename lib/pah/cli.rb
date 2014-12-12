require 'pah/commands'

module Pah
  class CLI
    class << self

      def start(argv)
        command = Commands.find_by_name(argv[0])
        command.new(extract_global_options(argv)).run(argv)
      end

      private
        def extract_global_options(argv)
          options = default_options
          argv.delete_if do |arg|
            if arg == "--verbose"
              options[:verbose] = true
              next true
            end
          end
          options
        end

        def default_options
          { verbose: false }
        end

    end
  end
end
