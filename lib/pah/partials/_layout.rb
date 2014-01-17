puts "Adding layout files ...".magenta

copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'app/views/application/_error_messages.html.haml'
copy_static_file 'app/views/application/_flash_messages.html.haml'

gsub_file 'app/views/layouts/application.html.haml', /page_title/, "page_title(app_name: '#{@app_name}')"

git :add => '.'
git :commit => "-aqm 'Add layout files.'"
puts "\n"
