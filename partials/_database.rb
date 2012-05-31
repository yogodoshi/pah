puts "Add database(#{options[:database]}) gem support ...".magenta

if options[:database] == "mysql"
  database_gem = "gem 'mysql2',         '0.3.11'"
else
  database_gem = "gem 'pg',             '0.13.2'"
end

gsub_file 'Gemfile', /DATABASE_GEM/, database_gem

git :add => '.'
git :commit => "-aqm 'Add #{options[:database]} gem.'"
puts "\n"