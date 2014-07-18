inside "public" do
  remove_file "robots.txt"
  remove_file "humans.txt"
  remove_file "404.html"
  remove_file "500.html"
end

copy_static_file 'public/robots.txt'
copy_static_file 'public/humans.txt'
copy_static_file 'public/404.html'
copy_static_file 'public/500.html'

git add: 'public/robots.txt'
git add: 'public/humans.txt'
git add: 'public/404.html'
git add: 'public/500.html'

git_commit 'Add public files.'
puts "\n"
