require 'colored' if Rails.env.development?

def run_with_clean_env(command, capture_output=false)
  Bundler.with_clean_env { capture_output ? `#{command}` : sh(command) }
end

def confirm(message)
  print "\n#{message}\nAre you sure? [yN] "
  raise 'Ok. Bye...' unless STDIN.gets.chomp.downcase == 'y'
end

namespace :heroku do
  PRODUCTION_APP = ENV['PRODUCTION_APP'] || ENV['APP']
  STAGING_APP = ENV['STAGING_APP'] || ENV['APP']

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

  namespace :deploy do

    desc "Deploy to staging"
    task :staging do
      APP = STAGING_APP

      backup(APP) if ENV['SKIP_BACKUP'] != "true"

      puts "--> Pushing".magenta
      run_with_clean_env("git push git@heroku.com:#{APP}.git HEAD:master --force")

      migrate(APP)
      seed(APP)
      restart(APP)
    end

    desc "Deploy to production"
    task :production do
      # This constant is defined to avoid problemd of copying and pasting from one environment to another
      APP = PRODUCTION_APP

      confirm("Going deploy to production...".red)

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
      run_with_clean_env("git push git@heroku.com:#{APP}.git #{tag_name}:master --force")

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
