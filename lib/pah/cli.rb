require 'pah/commands'

module Pah
  class CLI
    class << self

      def start(argv)
        command = Commands.find_by_name(argv[0])
        command.new(extract_global_options!(argv)).run(argv)
      end

      private
        def extract_global_options!(argv)
          options = {}
          options[:verbose] = !!argv.delete("--verbose")
          options
        end
    end
  end
end
