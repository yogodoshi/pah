say "Configuring Heroku application...".magenta

if would_you_like? "Create Heroku apps?".red
  config = {}
  heroku_name = @app_name.gsub('_','')
  new_heroku_name = ask "What do you want to call your app? (#{heroku_name})", :red
  heroku_name = new_heroku_name.present? ? new_heroku_name : heroku_name
  config['staging'] = would_you_like? "Create staging app? (#{heroku_name}-staging.heroku.com) [y,n]".red
  config['deploy']  = would_you_like? "Deploy immediately?".red
  config['domain']  = ask_unless_test "Add custom domain(customdomain.com) or leave blank".red

  say "Creating Heroku app '#{heroku_name}.herokuapp.com'".magenta
  system("heroku create #{heroku_name}")

  if config['staging']
    staging_name = ask_unless_test "What do you want to call your staging app?".red
    staging_name = "#{heroku_name}-staging"
    say "Creating staging Heroku app '#{staging_name}.herokuapp.com'".magenta
    system("heroku create #{staging_name}")
    say "Add git remote heroku for Heroku deploy.".magenta
    git :remote => "add heroku git@heroku.com:#{heroku_name}.git"
  end

  unless config['domain'].blank?
    run "heroku domains:add #{config['domain']}"
  end

  colaborators = ask_unless_test "Add collaborators? Type the email's separated by comma.".red

  if colaborators
    colaborators.split(",").map(&:strip).each do |email|
      run "heroku sharing:add #{email}"
    end
  end

  say "Adding heroku addon [PG Backups]...".magenta
  run "heroku addons:add pgbackups:plus"

  say "Adding heroku addon [Loggly]...".magenta
  run "heroku addons:add loggly:mole"

  sendgrid = yes? "Add sendgrid:starter addon? [yN]".red

  if sendgrid
    say "Adding heroku addon [Sendgrid]...".magenta
    run "heroku addons:add sendgrid:starter"
  end

  if config['deploy']
    say "Pushing application to heroku...".magenta
    git :push => "heroku master" if config['deploy']
  end
  run "heroku open" if config['deploy']
end
