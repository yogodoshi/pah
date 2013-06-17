# -*- encoding : utf-8 -*-
INTEGRATION_TASKS = %w(
  integration:heroku:add_remote
  integration:heroku:check
  integration:heroku:lock
  integration:start
  integration:bundle_install
  db:migrate
  spec
  integration:coverage_verify
  integration:finish
  heroku:deploy:production
  integration:heroku:unlock
)