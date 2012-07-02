copy_static_file 'config/database.yml'
gsub_file 'config/database.yml', /PROJECT/, @app_name
git :add => 'config/datase.yml'
git :commit => "-m 'Adding config/database.yml.'"

puts "\n"
