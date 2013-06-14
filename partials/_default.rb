puts "Adding default files ...".magenta

copy_static_file 'app/assets/stylesheets/reset.css'
copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'config/unicorn.rb'
copy_static_file 'Procfile'
copy_static_file "config/initializers/requires.rb"
copy_static_file "lib/tasks/integration.rake"

copy_static_file 'config/locales/pt-BR.yml'
copy_static_file 'public/index.html' if ENV['RAILS_TEMPLATE_TEST'] == 'true'

gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name

copy_static_file '.gitignore'

git :add => '.'
git :commit => "-aqm 'Add default stuff.'"
puts "\n"
