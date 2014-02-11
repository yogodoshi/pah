puts "Removing unnecessary files ... ".magenta

remove_file "README.rdoc"
remove_file "app/views/layouts/application.html.erb"

git add: '--all'
git_commit 'Removed unnecessary files left over from initial app generation.'
puts "\n"
