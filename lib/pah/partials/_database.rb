copy_static_file 'config/database.yml'
gsub_file 'config/database.yml', /PROJECT/, @app_name
git add: 'config/database.yml'
git commit: "-qm 'Adding config/database.yml.'"

in_root do
  run "rake db:create db:migrate db:test:clone"
end

git add: 'db/schema.rb'
git commit: "-qm 'Create database, adding db/schema.rb.'"

puts "\n"