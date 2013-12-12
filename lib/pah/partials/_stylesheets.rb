puts "Adding stylesheets files ...".magenta

copy_static_file 'app/assets/stylesheets/_variables.scss'
copy_static_file 'app/assets/stylesheets/application.css.scss'
copy_static_file 'app/assets/stylesheets/reset.scss'
copy_static_file 'app/assets/stylesheets/general.scss'
copy_static_file 'app/assets/stylesheets/form.scss'
copy_static_file 'app/assets/stylesheets/responsive.scss'

git :add => '--all'
git :commit => "-aqm 'Add stylesheets files.'"
puts "\n"
