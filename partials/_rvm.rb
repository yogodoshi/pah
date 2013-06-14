# Set up rvm private gemset
require 'rvm'
puts "Setting up RVM gemset and installing bundled gems (may take a while) ... ".magenta

# Need to strip colors in case rvm_pretty_print_flag is enabled in user's .rvmrc
rvm_list = `rvm list`.gsub(Regexp.new("\e\\[.?.?.?m"), '')

current_ruby = rvm_list.match(/=.? ([^ ]+)/)[1]
desired_ruby = ask_unless_test("Which RVM Ruby would you like to use? [#{current_ruby}]".red)
desired_ruby = current_ruby if desired_ruby.blank?

@env = RVM::Environment.new(desired_ruby)

gemset_name = ask_unless_test("What name should the custom gemset have? [#{@app_name}]".red)
gemset_name = @app_name if gemset_name.blank?

puts "Creating gemset #{gemset_name} in #{desired_ruby}"
@env.gemset_create(gemset_name)
puts "Now using gemset #{gemset_name}"
@env.gemset_use!(gemset_name)

if `rvm current`.strip.split('@')[1] != gemset_name
  puts "Error using gemset #{gemset_name}".red
  exit
end

# Since the gemset is likely empty, manually install bundler so it can install the rest
run "gem install bundler --no-ri --no-rdoc"

# Install all other gems needed from Gemfile
run "bundle install"

copy_static_file '.rvmrc'
gsub_file '.rvmrc', /PROJECT/, gemset_name
gsub_file '.rvmrc', /RUBYVERSION/, desired_ruby

append_file '.rvmrc' do
<<-EOF
export PRODUCTION_APP=#{@app_name}
export STAGING_APP=#{@app_name}-staging
EOF
end

git :add => '.rvmrc'
git :commit => "-qm 'Adding .rvmrc.'"

git :add => 'Gemfile.lock'
git :commit => "-qm 'Adding Gemfile.lock.'"

puts "\n"
