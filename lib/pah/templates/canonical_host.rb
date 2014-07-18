module Pah
  module Templates
    class CanonicalHost < Pah::Base

      def call
        rack_canonical = <<CANONICAL

#Run heroku config:add CANONICAL_HOST=yourdomain.com
#For more information, see: https://github.com/tylerhunt/rack-canonical-host#usage
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']
CANONICAL

        inject_into_file 'config.ru', rack_canonical, {after: "require ::File.expand_path('../config/environment',  __FILE__)", verbose: false}

        git add: 'config.ru'
        git_commit 'Add rack-canonical-host.'
      end
    end
  end
end
