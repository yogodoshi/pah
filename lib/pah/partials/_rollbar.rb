system "bundle exec rails generate rollbar"

search = <<HEREDOC
  # Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
  end
HEREDOC

replace = "  config.enabled = Rails.env.production? # || Rails.env.staging?"

gsub_file 'config/initializers/rollbar.rb', search, replace

git add: 'config/initializers/rollbar.rb'
git_commit 'Add rollbar initialize file.'
