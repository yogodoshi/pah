in_root do
  run "bundle exec rails generate simple_form:install"
end

git add: 'config'
git add: 'lib/templates'
git_commit 'Run `rails generate simple_form:install`'
