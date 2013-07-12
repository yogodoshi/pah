puts "Adding default files ...".magenta

copy_static_file 'app/assets/stylesheets/reset.css'
copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'config/unicorn.rb'
copy_static_file 'Procfile'
copy_static_file "lib/tasks/integration.rake"

copy_static_file 'config/locales/pt-BR.yml'

gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name

copy_static_file '.gitignore'

create_file ".env" do
<<-EOF
export PRODUCTION_APP=#{@app_name}
export STAGING_APP=#{@app_name}-staging
EOF
end

git :add => '.'
git :commit => "-aqm 'Add default stuff.'"
puts "\n"
