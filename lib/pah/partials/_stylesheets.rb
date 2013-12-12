puts "Adding stylesheets files ...".magenta

copy_static_file 'app/assets/stylesheets/application.css.scss'
remove_file 'app/assets/stylesheets/application.css'
copy_static_file 'app/assets/stylesheets/reset.css'

git :add => '--all'
git :commit => "-aqm 'Add stylesheets files.'"
puts "\n"
