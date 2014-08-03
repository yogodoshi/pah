module Pah
  module Templates
    class RackDeflater < Pah::Template
      def call
        file = 'config/application.rb'
        inject = "\n\n    config.middleware.use Rack::Deflater"
        options = { after: /config\.i18n\.locale = :'.*'/, verbose: false }

        inject_into_file file, inject, options

        git add: 'config/application.rb'
        git_commit 'Add Rack::Deflater middleware.'
      end
    end
  end
end
