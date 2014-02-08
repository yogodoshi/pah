puts "Setting up Rack::Timeout... ".magenta

copy_static_file 'config/initializers/rack_timeout.rb'

git add: 'config/initializers/rack_timeout.rb'
git commit: "-qm 'Adding Rack::Timeout configuration.'"

puts "\n"
