copy_static_file 'Gemfile'
copy_static_file 'config/database.yml'
gsub_file 'config/database.yml', /PROJECT/, @app_name

git :add => '.'
git :commit => "-aqm 'Add postgres gem and Gemfile.'"
puts "\n"
