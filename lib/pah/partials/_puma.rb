puts "Configuring Puma... ".magenta

copy_static_file 'config/initializers/database_connection.rb'

git add: 'config/initializers/database_connection.rb'
git commit: "-qm 'Configuring Puma.'"

puts "\n"
