puts "Setting up Integration... ".magenta

copy_static_file 'lib/tasks/integration.rake'
copy_static_file 'lib/tasks/deploy.rake'
gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name
gsub_file 'lib/tasks/deploy.rake', /PROJECT/, @app_name

git :add => 'lib/tasks/integration.rake lib/tasks/deploy.rake'
git :commit => "-qm 'Adding integration tasks.'"

puts "\n"
