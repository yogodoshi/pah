require 'pah'

Pah.configure do |config|
  config.app_name = @app_name
end

runner = Pah::Runner.new([], self.options)
runner.apply_n :config
runner.apply_n :git,             "Initializing new Git repo\n"
runner.apply_n :ruby_env,        "Setting up ruby env\n"
runner.apply_n :cleanup,         "Removing unnecessary files\n"
runner.apply_n :gems,            "Setting up bundler and installing bundled gems (may take a while)"
runner.apply_n :database,        "Initializing databases\n"
runner.apply_n :rspec,           "Setting up RSpec\n"
runner.apply_n :layout,          "Adding layout files\n"
runner.apply_n :bourbon,         "Setting up Bourbon files\n"
runner.apply_n :public,          "Adding public files\n"
runner.apply_n :inflection,      "Adding API acronym to inflection file\n"
runner.apply_n :secure_headers,  "Adding secure headers\n"
runner.apply_n :secret_token,    "Replacing secret token with environment variable\n"
runner.apply_n :capybara,        "Adding capybara helpers\n"
runner.apply_n :generators,      "Adding generators\n"
runner.apply_n :simple_form,     "Configuring simple_form\n"
runner.apply_n :letter_opener,   "Adding letter_opener\n"
runner.apply_n :mandrill,        "Adding mandrill\n"
runner.apply_n :bullet,          "Setting up bullet\n"
runner.apply_n :locale,          "Adding locale\n"
runner.apply_n :canonical_host,  "Configuring canonical hosts\n"
runner.apply_n :puma,            "Configuring Puma\n"
runner.apply_n :rack_timeout,    "Setting up Rack::Timeout\n"
runner.apply_n :rack_deflater,   "Setting up Rack::Deflater\n"
runner.apply_n :jumpup,          "Setting up Jumpup\n"
runner.apply_n :newrelic,        "Setting up New Relic\n"
runner.apply_n :readme,          "Adding default README\n"
runner.apply_n :rollbar,         "Setting up Rollbar\n"
runner.apply_n :heroku,          "Configuring Heroku application\n"
runner.apply_n :bin,             "Configuring the binstub\n"

puts "Installation finished!".green.bold
