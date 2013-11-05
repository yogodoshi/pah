# Set up rvm private gemset
require 'rvm'
puts "Setting up RVM gemset ... ".magenta

# Need to strip colors in case rvm_pretty_print_flag is enabled in user's .rvmrc
rvm_list = `rvm list`.gsub(Regexp.new("\e\\[.?.?.?m"), '')

current_ruby = rvm_list.match(/=.? ([^ ]+)/)[1]
desired_ruby = current_ruby.gsub(/\-p\d+/, "")

@env = RVM::Environment.new(desired_ruby)

gemset_name = @app_name

puts "Creating gemset #{gemset_name} in #{desired_ruby}"
@env.gemset_create(gemset_name)
puts "Now using gemset #{gemset_name}"
@env.gemset_use!(gemset_name)

rvm_current = `rvm current`.match(/[\w\d.-]+@[\w\d\.-]+/)[0].strip.split('@').last

if rvm_current != gemset_name
  puts "Error using gemset #{gemset_name}:".red
  puts "#{rvm_current} does not match the gemset #{gemset_name}".yellow
  exit
end

copy_static_file '.ruby-version'
gsub_file '.ruby-version', /RUBY_VERSION/, desired_ruby

copy_static_file '.ruby-gemset'
gsub_file '.ruby-gemset', /GEMSET/, gemset_name

git :add => '.ruby-version'
git :add => '.ruby-gemset'
git :commit => "-qm 'Adding RVM config files.'"

puts "\n"