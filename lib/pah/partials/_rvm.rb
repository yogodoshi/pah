# Set up rvm private gemset
require 'rvm'
puts "Setting up ruby env ... ".magenta

current_ruby_env = `rvm-prompt i v g`.split("@")
current_ruby = current_ruby_env[0]
current_gemset = current_ruby_env[1]

copy_static_file '.ruby-version'
gsub_file '.ruby-version', /RUBY_VERSION/, current_ruby

copy_static_file '.ruby-gemset'
gsub_file '.ruby-gemset', /GEMSET/, current_gemset

git :add => '.ruby-version'
git :add => '.ruby-gemset'
git :commit => "-qm 'Adding RVM config files.'"

puts "\n"