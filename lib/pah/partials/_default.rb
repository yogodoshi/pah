puts "Adding default files ...".magenta

copy_static_file 'app/assets/stylesheets/reset.css'
copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'app/views/application/_error_messages.html.haml'
copy_static_file 'app/views/application/_flash_messages.html.haml'
copy_static_file 'config/unicorn.rb'
copy_static_file 'Procfile'
copy_static_file 'config/locales/pt-BR.yml'
copy_static_file '.gitignore'

create_file ".env"
append_to_file '.env', "APP: #{@app_name}\n"

git :add => '.'
git :commit => "-aqm 'Add default stuff.'"
puts "\n"
