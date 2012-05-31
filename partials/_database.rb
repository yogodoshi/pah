puts "Add database(#{options[:database]}) gem support ...".magenta

copy_static_file 'Gemfile'

database_gem = case options[:database]
  when "mysql"      then "gem 'mysql2',         '0.3.11'"
  when "postgresql" then "gem 'pg',             '0.13.2'"
  else  "gem 'sqlite3'"
end

gsub_file 'Gemfile', /DATABASE_GEM/, database_gem

git :add => '.'
git :commit => "-aqm 'Add #{options[:database]} gem.'"
puts "\n"