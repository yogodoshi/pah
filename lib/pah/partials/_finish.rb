in_root do
  run "rake db:create db:migrate db:test:clone"
end

git :add => 'db/schema.rb'
git :commit => "-qm 'Create database, adding db/schema.rb.'"

puts "\n"
