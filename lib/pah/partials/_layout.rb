puts "Adding layout files ...".magenta

copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'app/views/application/_error_messages.html.haml'
copy_static_file 'app/views/application/_flash_messages.html.haml'

git :add => '.'
git :commit => "-aqm 'Add layout files.'"
puts "\n"
