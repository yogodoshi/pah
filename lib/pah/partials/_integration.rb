puts "Setting up Integration... ".magenta

copy_static_file 'lib/tasks/integration.rake'
gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name

git :add => 'lib/tasks/integration.rake'
git :commit => "-qm 'Adding integration tasks.'"

puts "\n"
