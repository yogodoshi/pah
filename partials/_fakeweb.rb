puts "Setting up Fakeweb ... ".magenta

copy_static_file 'spec/support/fakeweb.rb'

git :add => '.'
git :commit => "-aqm 'Configured fakeweb.'"
puts "\n"
