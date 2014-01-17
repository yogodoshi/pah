puts "Setting up Jumpup... ".magenta

copy_static_file 'lib/tasks/jumpup.rake'
copy_static_file 'config/initializers/jumpup_heroku.rb'

gsub_file 'config/initializers/jumpup_heroku.rb', /PROJECT/, (@config[:heroku][:name] || @app_name)

git add: 'lib/tasks/jumpup.rake'
git add: 'config/initializers/jumpup_heroku.rb'
git commit: "-qm 'Adding jumpup tasks and configuration.'"

puts "\n"
