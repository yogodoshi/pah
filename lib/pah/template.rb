require File.join(File.dirname(__FILE__), 'base.rb')

puts "\n========================================================="
puts " Pah".yellow.bold
puts "=========================================================\n"

Pah::Base.instance.app_name = @app_name

Pah::Base.instance.apply_n :config
Pah::Base.instance.apply_n :git,             'Initializing new Git repo...'
Pah::Base.instance.apply_n :ruby_env,        'Setting up ruby env...'
Pah::Base.instance.apply_n :cleanup,         'Removing unnecessary files...'
Pah::Base.instance.apply_n :gems,            'Setting up bundler and installing bundled gems (may take a while)...'
Pah::Base.instance.apply_n :database,        'Initializing databases...'
Pah::Base.instance.apply_n :rspec,           'Setting up RSpec...'
Pah::Base.instance.apply_n :layout,          'Adding layout files...'
Pah::Base.instance.apply_n :bourbon,         'Setting up Bourbon files...'
Pah::Base.instance.apply_n :public,          'Adding public files...'
Pah::Base.instance.apply_n :secure_headers,  'Adding secure headers...'
Pah::Base.instance.apply_n :secret_token,    'Replacing secret token with environment variable...'
Pah::Base.instance.apply_n :capybara,        'Adding capybara helpers...'
Pah::Base.instance.apply_n :generators,      'Adding generators...'
Pah::Base.instance.apply_n :simple_form,     'Configuring simple_form...'
Pah::Base.instance.apply_n :letter_opener,   'Adding letter_opener...'
Pah::Base.instance.apply_n :sendgrid,        'Adding sendgrid...'
Pah::Base.instance.apply_n :bullet,          'Setting up bullet...'
Pah::Base.instance.apply_n :locale,          'Adding locale...'
Pah::Base.instance.apply_n :canonical_host,  'Configuring canonical hosts...'
Pah::Base.instance.apply_n :puma,            'Configuring Puma...'
Pah::Base.instance.apply_n :rack_timeout,    'Setting up Rack::Timeout...'
Pah::Base.instance.apply_n :rack_deflater,   'Setting up Rack::Deflater...'
Pah::Base.instance.apply_n :jumpup,          'Setting up Jumpup...'
Pah::Base.instance.apply_n :newrelic,        'Setting up New Relic...'
Pah::Base.instance.apply_n :readme,          'Adding default README...'
Pah::Base.instance.apply_n :rollbar,         'Setting up Rollbar...'
Pah::Base.instance.apply_n :heroku,          'Configuring Heroku application...'
Pah::Base.instance.apply_n :bin,             'Configuring the binstub...'

puts "\n========================================================="
puts " CONGRATS! INSTALLATION COMPLETE!".yellow.bold
puts "=========================================================\n\n\n"
def run_bundle; end
