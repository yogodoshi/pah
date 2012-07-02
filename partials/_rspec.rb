puts "Setting up RSpec ... ".magenta

remove_dir 'test'

run "#{@rvm} exec rails generate rspec:install"
copy_static_file 'spec/spec_helper.rb'

git :add => '.'
git :commit => "-aqm 'Configured RSpec.'"
puts "\n"
