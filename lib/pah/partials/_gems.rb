puts "Setting up bundler and installing bundled gems (may take a while) ... ".magenta

copy_static_file 'Gemfile'

in_root do
  gsub_file 'Gemfile', /RAILS_VERSION/, ::Pah::RAILS_VERSION

  # Since the gemset is likely empty, manually install bundler so it can install the rest
  run "gem install bundler --no-ri --no-rdoc"

  # Install all other gems needed from Gemfile
  run "bundle install"
end

git add: 'Gemfile*'
git_commit 'Add Gemfile and Gemfile.lock.'
puts "\n"