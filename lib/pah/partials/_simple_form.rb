in_root do
  run "bundle exec rails generate simple_form:install"
end

git add: 'config/initializers'
git_commit 'Run `rails generate simple_form:install`'
