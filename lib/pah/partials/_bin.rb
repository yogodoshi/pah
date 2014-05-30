in_root do
  Bundler.with_clean_env do
    system 'bundle exec spring binstub --all'
  end
end

git add: 'bin/rake bin/rails bin/spring'
git_commit 'Add spring bin files'
