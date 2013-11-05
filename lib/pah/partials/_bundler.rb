# Set up rvm private gemset
puts "Setting up bundler and installing bundled gems (may take a while) ... ".magenta

# Since the gemset is likely empty, manually install bundler so it can install the rest
run "gem install bundler --no-ri --no-rdoc"

# Install all other gems needed from Gemfile
run "bundle install"

git :add => 'Gemfile.lock'
git :commit => "-qm 'Adding Gemfile.lock.'"
puts "\n"