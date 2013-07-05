puts "Setting up Integration... ".magenta
copy_static_file 'lib/tasks/integration.rake'
copy_static_file 'lib/tasks/tasks.rake'
gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name
gsub_file 'lib/tasks/tasks.rake', /PROJECT/, @app_name
git :add => 'lib/tasks/integration.rake lib/tasks/tasks.rake'
git :commit => "-qm 'Adding integration'"

puts "\n"
