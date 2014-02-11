inside "public" do
  remove_file "robots.txt"
end

copy_static_file 'public/robots.txt'

git add: 'public/robots.txt'
git_commit 'Add public files.'