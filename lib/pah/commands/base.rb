module Pah
  class Commands
    class Base

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def run(argv)
        raise "#{self.class} subclasses should implement the #run method"
      end
    end
  end
end
