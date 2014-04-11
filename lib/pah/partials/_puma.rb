copy_static_file 'config/initializers/database_connection.rb'
copy_static_file 'config/initializers/puma_auto_tune.rb'

git add: 'config/initializers/database_connection.rb'
git add: 'config/initializers/puma_auto_tune.rb'
git_commit 'Configure Puma.'
