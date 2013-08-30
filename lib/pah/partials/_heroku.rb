class HerokuApp < Rails::Generators::AppGenerator
  DEFAULT_ADDONS = %w(pgbackups:plus loggly:mole sendgrid:starter)

  attr_reader :name, :description

  def initialize(name, description, staging=false)
    @name = name
    @description = description

    create
    add_secret_token
    add_timezone_config
    add_addons

    unless staging
      add_heroku_git_remote
      check_canonical_domain
      check_collaborators
    end
  end

  def create
    created = false
    default = @name

    while not created do
      @name = ask "What do you want to call your Heroku #{description}? (#{default})", :red
      @name = @name.present? ? name : default

      say "Creating Heroku app '#{name}.herokuapp.com'".magenta
      created = system "heroku create #{name}"

      unless created
        puts "Heroku '#{name}' app already exists or could not be created, please provide a new name"
      end
    end

    @app
  end

  def add_addons
    DEFAULT_ADDONS.each { |addon| add_heroku_addon(addon) }
  end

  def add_secret_token
    say "Creating SECRET_TOKEN for Heroku '#{name}.herokuapp.com'".magenta
    system "heroku config:set SECRET_TOKEN=#{SecureRandom::hex(60)} --app #{name}"
  end

  def add_heroku_git_remote
    say "Adding Heroku git remote for deploy to '#{name}'.".magenta
    git remote: "add heroku git@heroku.com:#{name}.git"
  end

  def add_heroku_addon(addon)
    say "Adding heroku addon [#{addon}] to '#{name}'.".magenta
    system "heroku addons:add #{addon} --app #{name}"
  end

  def add_canonical_domain(domain)
    system "heroku domains:add #{domain} --app #{name}"
  end

  def add_collaborator(email)
    system "heroku sharing:add #{email} --app #{name}"
  end

  def add_timezone_config
    say "Adding timezone config on Heroku".magenta
    system "heroku config:add TZ=America/Sao_Paulo --app #{name}"
  end

  def open
    say "Pushing application to heroku...".magenta
    git push: "heroku master"

    system "heroku open --app #{name}"
  end

  private
    def thor
      thor ||= Thor::Shell::Basic.new
    end

    def check_canonical_domain
      domain = ask "Add custom domain (customdomain.com) or leave blank:".red
      add_canonical_domain(domain) unless domain.blank?
    end

    def check_collaborators
      collaborators = ask "Add collaborators? Type the email's separated by comma (,):".red

      if collaborators.present?
        collaborators.split(",").map(&:strip).each { |email| add_collaborator(email) }
      end
    end
end

say "Configuring Heroku application...".magenta
if would_you_like? "Create Heroku apps?".red

  say "Refreshing Heroku user credentials".magenta
  unless system "heroku auth:login"
    puts "Could not login to Heroku, halting"
    exit
  end

  config = {}
  config['staging'] = would_you_like? "Create staging app?".red
  config['deploy']  = would_you_like? "Deploy immediately?".red

  production_app = HerokuApp.new(@app_name.gsub('_',''), "app")
  staging_app = HerokuApp.new("#{production_app.name}-staging", "staging app", true) if config['staging']

  production_app.open if config['deploy']
end
