module Pah
  module Templates
    class Generator < Pah::Template
      def call
        generators = <<GENERATORS

    # Do not generate specs for views and requests. Also, do not generate assets.
    config.generators do |g|
      g.helper false
      g.view_specs false
      g.assets false
      g.integration_tool false
    end
    config.app_generators do |g|
      g.test_framework :rspec
    end

    # Prevent initializing your application and connect to the database on assets precompile.
    config.assets.initialize_on_precompile = false
GENERATORS

        inject_into_file 'config/application.rb', generators, after: 'Rails::Application', verbose: false

        git add: 'config/application.rb'
        git_commit 'Add generators.'
      end
    end
  end
end
