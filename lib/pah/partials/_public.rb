puts "Adding public files ...".magenta

inside "public" do
  remove_file "robots.txt"
end

copy_static_file 'public/robots.txt'

git add: '--all'
git commit: "-aqm 'Add public files.'"
puts "\n"
