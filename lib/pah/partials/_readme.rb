copy_static_file 'README.md'
gsub_file 'README.md', /PROJECT/, @app_name

git add: 'README.md'
git_commit 'Add README file.'
