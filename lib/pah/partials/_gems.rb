copy_static_file 'Gemfile'

in_root do
  gsub_file 'Gemfile', /RAILS_VERSION/, ::Pah::RAILS_VERSION

  # Since the gemset is likely empty, manually install bundler so it can install the rest
  if !(run "gem install bundler --no-ri --no-rdoc")
    puts "Error installing bundler, will attempt to continue"
  end

  # Install all other gems needed from Gemfile
  require 'bundler'
  Bundler.with_clean_env do
    if !(run "bundle install --jobs=4")
      puts "Error installing gems, aborting"
      exit 1
    end
  end
end

git add: 'Gemfile*'
git_commit 'Add Gemfile and Gemfile.lock.'
