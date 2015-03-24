module Pah
  class Commands
    class << self

      def find_by_name(name)
        COMMAND_BY_NAME[name.to_s.strip] || Pah::Commands::App
      end

    end
  end
end

require 'colored'
require 'pah/commands/base'
require 'pah/commands/version'
require 'pah/commands/help'
require 'pah/commands/app'

COMMAND_BY_NAME = {
  "" => Pah::Commands::Help,
  "-v" => Pah::Commands::Version,
  "--version" => Pah::Commands::Version
}.freeze

