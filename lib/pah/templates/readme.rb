copy_static_file 'README.md'
gsub_file 'README.md', /PROJECT/, @app_name
gsub_file 'README.md', /RUBY_VERSION/, RUBY_VERSION

git add: 'README.md'
git_commit 'Add README file.'
