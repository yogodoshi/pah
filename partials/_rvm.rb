# Set up rvm private gemset
require 'rvm'
puts "Setting up RVM gemset and installing bundled gems (may take a while) ... ".magenta

# Need to strip colors in case rvm_pretty_print_flag is enabled in user's .rvmrc
rvm_list = `rvm list`.gsub(Regexp.new("\e\\[.?.?.?m"), '')

current_ruby = rvm_list.match(/=> ([^ ]+)/)[1]
desired_ruby = ask("Which RVM Ruby would you like to use? [#{current_ruby}]".red)
desired_ruby = current_ruby if desired_ruby.blank?

@env = RVM::Environment.new(desired_ruby)

gemset_name = ask("What name should the custom gemset have? [#{@app_name}]".red)
gemset_name = @app_name if gemset_name.blank?

#This will work after my pull request gets accepted
#https://github.com/wayneeseguin/rvm-gem/pull/9
puts "Creating gemset #{@app_name} in #{desired_ruby}"
@env.gemset_create(app_name)
puts "Now using gemset #{@app_name}"
@env.gemset_use!(app_name)

# Create the gemset
# run "rvm #{desired_ruby} gemset create #{gemset_name}"

# Let us run shell commands inside our new gemset. Use this in other template partials.

# Create .rvmrc
# file '.rvmrc', @rvm

# Make the .rvmrc trusted
# run "rvm rvmrc trust #{@app_path}"
# puts "Installing rails gem."
# puts "Successfully installed rails"

# Since the gemset is likely empty, manually install bundler so it can install the rest
run "gem install bundler --no-ri --no-rdoc"

# Install all other gems needed from Gemfile
run "bundle install"

puts "\n"
