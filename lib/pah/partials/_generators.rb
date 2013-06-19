puts "Adding generators... ".magenta

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

in_root do
  inject_into_file 'config/application.rb', generators, {after: "Rails::Application", verbose: false}
end

git :add => 'config/application.rb'
git :commit => "-qm 'Adding generators.'"

letter_opener_config = <<LETTER_OPENER

  # Letter openner config
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
LETTER_OPENER

in_root do
  inject_into_file 'config/environments/development.rb', letter_opener_config, { before: /^end/, verbose: false }
end

git :add => 'config/environments/development.rb'
git :commit => "-qm 'Adding letter_opener config.'"

