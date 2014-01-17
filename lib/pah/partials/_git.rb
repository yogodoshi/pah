puts "Initializing new Git repo ...".magenta

copy_static_file '.gitignore'

git :init
git add: "--all"
git commit: "-aqm 'Initial commit.'"

puts "\n"