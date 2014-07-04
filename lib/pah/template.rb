require File.join(File.dirname(__FILE__), 'pah.rb')

puts "\n========================================================="
puts " Pah".yellow.bold
puts "=========================================================\n"

apply_n :config
apply_n :git,             'Initializing new Git repo...'
apply_n :ruby_env,        'Setting up ruby env...'
apply_n :cleanup,         'Removing unnecessary files...'
apply_n :gems,            'Setting up bundler and installing bundled gems (may take a while)...'
apply_n :database,        'Initializing databases...'
apply_n :rspec,           'Setting up RSpec...'
apply_n :layout,          'Adding layout files...'
apply_n :bourbon,         'Setting up Bourbon files...'
apply_n :public,          'Adding public files...'
apply_n :secure_headers,  'Adding secure headers...'
apply_n :secret_token,    'Replacing secret token with environment variable...'
apply_n :capybara,        'Adding capybara helpers...'
apply_n :generators,      'Adding generators...'
apply_n :simple_form,     'Configuring simple_form...'
apply_n :letter_opener,   'Adding letter_opener...'
apply_n :sendgrid,        'Adding sendgrid...'
apply_n :bullet,          'Setting up bullet...'
apply_n :locale,          'Adding locale...'
apply_n :canonical_host,  'Configuring canonical hosts...'
apply_n :puma,            'Configuring Puma...'
apply_n :rack_timeout,    'Setting up Rack::Timeout...'
apply_n :rack_deflater,   'Setting up Rack::Deflater...'
apply_n :jumpup,          'Setting up Jumpup...'
apply_n :newrelic,        'Setting up New Relic...'
apply_n :readme,          'Adding default README...'
apply_n :rollbar,         'Setting up Rollbar...'
apply_n :heroku,          'Configuring Heroku application...'
apply_n :bin,             'Configuring the binstub...'

puts "\n========================================================="
puts " CONGRATS! INSTALLATION COMPLETE!".yellow.bold
puts "=========================================================\n\n\n"
def run_bundle; end
