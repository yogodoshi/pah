module Pah
  module Templates
    class RackTimeout < Pah::Template

      def call
        copy_static_file 'config/initializers/rack_timeout.rb'

        git add: 'config/initializers/rack_timeout.rb'
        git_commit 'Add Rack::Timeout configuration.'
      end
    end
  end
end
