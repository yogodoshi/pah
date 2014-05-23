exec "bundle exec rails generate rollbar"

gsub_file 'config/initializers/rollbar.rb', /Rails\.env\.test\?/, "Rails.env.production?"
gsub_file 'config/initializers/rollbar.rb', /config\.enabled = false/, "config.enabled = true"

git add: 'config/initializers/rollbar.rb'
git_commit 'Add rollbar initialize file.'
