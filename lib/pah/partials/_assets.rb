puts "Adding asset files ...".magenta

copy_static_file 'app/assets/javascripts/application.js'
copy_static_file 'app/assets/stylesheets/_variables.scss'
copy_static_file 'app/assets/stylesheets/application.scss'
copy_static_file 'app/assets/stylesheets/reset.scss'
copy_static_file 'app/assets/stylesheets/general.scss'
copy_static_file 'app/assets/stylesheets/form.scss'
copy_static_file 'app/assets/stylesheets/responsive.scss'

git add: '--all'
git_commit 'Add asset files.'
puts "\n"
