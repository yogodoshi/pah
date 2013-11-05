require 'colored' if Rails.env.development?

def run_with_clean_env(command, capture_output=false)
  Bundler.with_clean_env { capture_output ? `#{command}` : sh(command) }
end

def confirm(message)
  print "\n#{message}\nAre you sure? [yN] "
  raise 'Ok. Bye...' unless STDIN.gets.chomp.downcase == 'y'
end

def has_database?(app)
  database_url = run_with_clean_env("heroku config -s --app #{app} | grep DATABASE_URL", true).strip
  not database_url.blank?
end

def backup(app)
  return unless has_database?(app)
  puts "--> Backing up database via Heroku".magenta
  run_with_clean_env("heroku pgbackups:capture --expire --app #{app}")
end

def migrate(app)
  return unless has_database?(app)
  puts "--> Migrating".magenta
  run_with_clean_env("heroku run rake db:migrate --app #{app}")
end

def seed(app)
  return unless has_database?(app)
  puts "--> Seeding".magenta
  run_with_clean_env("heroku run rake db:seed --app #{app}")
end

def restart(app)
  puts "--> Restarting".magenta
  run_with_clean_env("heroku restart --app #{app}")
end

namespace :integration do
  APP = 'PROJECT'
  USER = run_with_clean_env("git config --get user.name", true).strip

  namespace :heroku do

    desc "Add Heroku git remotes"
    task :add_remote do
      puts "--> Adding Heroku git remotes for app #{APP}".magenta

      remote = run_with_clean_env("git remote | grep heroku", true).strip
      run_with_clean_env("git remote add heroku git@heroku.com:#{APP}.git") if remote.blank?
    end

    desc "Check if there's someone else integrating the project"
    task :check do
      puts "--> Checking if there's already someone integrating to #{APP}".magenta

      var = run_with_clean_env("heroku config -s --app #{APP} | grep INTEGRATING_BY", true).strip
      integrating_by = var.split('=')[1]

      integrating_by.strip! unless integrating_by.blank?

      if integrating_by != USER and not integrating_by.blank?
        puts "--> Project is already being integrated by '#{integrating_by}', halting"
        exit
      end
    end

    desc "Lock the Heroku integration"
    task :lock do
      puts "--> Locking Heroku integration for you (#{USER})".magenta
      run_with_clean_env("heroku config:set INTEGRATING_BY='#{USER}' --app #{APP}")
    end

    desc "Unlock the Heroku integration"
    task :unlock do
      puts "--> Unlocking Heroku integration".magenta
      run_with_clean_env("heroku config:unset INTEGRATING_BY --app #{APP}")
    end

    desc "Deploy to heroku"
    task :deploy do
      confirm("Going deploy [#{APP}]...".red)

      if ENV['SKIP_TESTS'] != "true"
        puts "--> Running all specs".magenta
        Rake::Task['spec'].invoke
      end

      print "\nPut #{APP} in maintenance mode? [Yn] ".red
      maintenance = (ENV['MAINTENANCE'] == "true" or (STDIN.gets.chomp.downcase == 'y'))

      if maintenance
        puts "--> Setting Maintenance on".magenta
        run_with_clean_env("heroku maintenance:on --app #{APP}")

        puts "--> Restarting".magenta
        run_with_clean_env("heroku restart --app #{APP}")

        puts "--> Waiting 20 seconds to app come back (in maintenance mode)".magenta
        sleep(20)
      end

      backup(APP) if ENV['SKIP_BACKUP'] != "true"

      iso_date = Time.now.strftime('%Y-%m-%dT%H%M%S')
      tag_name = "production-#{iso_date}"

      puts "--> Tagging as #{tag_name}".magenta
      run_with_clean_env("git tag #{tag_name} master")

      puts "--> Pushing".magenta
      run_with_clean_env("git push origin #{tag_name}")
      run_with_clean_env("git push git@heroku.com:#{APP}.git HEAD:master")

      migrate(APP)
      seed(APP)

      if maintenance
        puts "Setting Maintenance off".magenta
        run_with_clean_env("heroku maintenance:off --app #{APP}")
      end

      restart(APP)
    end
  end
end

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
  integration:heroku:deploy
  integration:heroku:unlock
)
