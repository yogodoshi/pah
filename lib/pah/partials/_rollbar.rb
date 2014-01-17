puts "Setting up rollbar... ".magenta

gsub_file 'config/initializers/rollbar.rb', /Rails\.env\.test\?/, "Rails.env.production?"
gsub_file 'config/initializers/rollbar.rb', /config\.enabled = false/, "config.enabled = true"

git add: 'config/initializers/rollbar.rb'
git commit: "-qm 'Add rollbar initialize file.'"

puts "\n"