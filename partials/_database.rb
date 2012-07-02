copy_static_file 'config/database.yml'
gsub_file 'config/database.yml', /PROJECT/, @app_name
git :add => 'config/database.yml'
git :commit => "-qm 'Adding config/database.yml.'"

puts "\n"
