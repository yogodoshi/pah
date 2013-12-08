puts "Removing unnecessary files ... ".magenta

remove_file "README.rdoc"
remove_file "app/views/layouts/application.html.erb"

inside "public" do
	remove_file "favicon.ico"
	remove_file "robots.txt"
end

git :add => '.'
git :commit => "--all -qm 'Removed unnecessary files left over from initial app generation.'"
puts "\n"
