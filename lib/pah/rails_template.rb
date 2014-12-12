require 'pah'

Pah.configure do |config|
  config.app_name = @app_name
end

runner = Pah::Runner.new([], self.options)
runner.apply_n :config
runner.apply_n :git,             'Initializing new Git repo...'
runner.apply_n :ruby_env,        'Setting up ruby env...'
runner.apply_n :cleanup,         'Removing unnecessary files...'
runner.apply_n :gems,            'Setting up bundler and installing bundled gems (may take a while)...'
runner.apply_n :database,        'Initializing databases...'
runner.apply_n :rspec,           'Setting up RSpec...'
runner.apply_n :layout,          'Adding layout files...'
runner.apply_n :bourbon,         'Setting up Bourbon files...'
runner.apply_n :public,          'Adding public files...'
runner.apply_n :inflection,      'Adding API acronym to inflection file...'
runner.apply_n :secure_headers,  'Adding secure headers...'
runner.apply_n :secret_token,    'Replacing secret token with environment variable...'
runner.apply_n :capybara,        'Adding capybara helpers...'
runner.apply_n :generators,      'Adding generators...'
runner.apply_n :simple_form,     'Configuring simple_form...'
runner.apply_n :letter_opener,   'Adding letter_opener...'
runner.apply_n :mandrill,        'Adding mandrill...'
runner.apply_n :bullet,          'Setting up bullet...'
runner.apply_n :locale,          'Adding locale...'
runner.apply_n :canonical_host,  'Configuring canonical hosts...'
runner.apply_n :puma,            'Configuring Puma...'
runner.apply_n :rack_timeout,    'Setting up Rack::Timeout...'
runner.apply_n :rack_deflater,   'Setting up Rack::Deflater...'
runner.apply_n :jumpup,          'Setting up Jumpup...'
runner.apply_n :newrelic,        'Setting up New Relic...'
runner.apply_n :readme,          'Adding default README...'
runner.apply_n :rollbar,         'Setting up Rollbar...'
runner.apply_n :heroku,          'Configuring Heroku application...'
runner.apply_n :bin,             'Configuring the binstub...'

