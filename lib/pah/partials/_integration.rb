puts "Setting up Integration... ".magenta

copy_static_file 'lib/tasks/integration.rake'
copy_static_file 'config/initializers/jumpup_heroku.rb'

gsub_file 'config/initializers/jumpup_heroku.rb', /PROJECT/, (@config[:heroku][:name] || @app_name)

git :add => 'lib/tasks/integration.rake'
git :add => 'config/initializers/jumpup_heroku.rb'
git :commit => "-qm 'Adding integration tasks and configuration.'"

puts "\n"
