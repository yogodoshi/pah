require 'pah/commands'

module Pah
  class CLI
    class << self

      def start(argv)
        command = Commands.find_by_name(argv[0])
        command.new.run(argv)
      end

    end
  end
end
