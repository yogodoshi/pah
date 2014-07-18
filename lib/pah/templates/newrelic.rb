copy_static_file 'config/newrelic.yml'

gsub_file 'config/newrelic.yml', /PROJECT/, @app_name

git add: 'config/newrelic.yml'
git_commit 'Add New Relic configuration.'
