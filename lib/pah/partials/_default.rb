puts "Adding default files ...".magenta

copy_static_file 'app/assets/stylesheets/_variables.scss'
copy_static_file 'app/assets/stylesheets/application.css.scss'
copy_static_file 'app/assets/stylesheets/reset.scss'
copy_static_file 'app/assets/stylesheets/form.scss'
copy_static_file 'app/assets/stylesheets/responsive.scss'
copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'app/views/application/_error_messages.html.haml'
copy_static_file 'app/views/application/_flash_messages.html.haml'
copy_static_file 'config/unicorn.rb'
copy_static_file 'Procfile'
copy_static_file 'config/locales/pt-BR.yml'
copy_static_file '.gitignore'
copy_static_file '.env'

git :add => '.'
git :commit => "-aqm 'Add default stuff.'"
puts "\n"
