puts "Adding any missed Gem and saving Gemfile.lock ... ".magenta

in_root do
  # Install all other gems needed from Gemfile
  run "bundle install"
end

git :add => 'Gemfile.lock'
git :commit => "-qm 'Add any missed Gem and update Gemfile.lock'"
puts "\n"