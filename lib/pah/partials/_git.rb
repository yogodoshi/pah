puts "Initializing new Git repo ...".magenta

git :init
git :add => "--all"
git :commit => "-aqm 'Initial commit.'"

puts "\n"