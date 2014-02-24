puts "Adding bullet... ".magenta

copy_static_file 'config/initializers/bullet.rb'

git add: 'config/initializers/bullet.rb'
git_commit 'Adding bullet config.'
