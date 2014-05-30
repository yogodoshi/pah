in_root do
  Bundler.with_clean_env do
    system "bundle exec rails generate rollbar"
  end
end

gsub_file 'config/initializers/rollbar.rb', /Rails\.env\.test\?/, "Rails.env.production?"
gsub_file 'config/initializers/rollbar.rb', /config\.enabled = false/, "config.enabled = true"

git add: 'config/initializers/rollbar.rb'
git_commit 'Add rollbar initialize file.'
