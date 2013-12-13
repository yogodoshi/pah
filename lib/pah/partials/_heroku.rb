class HerokuApp < Rails::Generators::AppGenerator
  DEFAULT_ADDONS = %w(pgbackups:auto-month loggly:mole sendgrid:starter)

  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description

    create
    add_secret_token
    add_timezone_config
    add_addons
    add_heroku_git_remote
    check_canonical_domain
    check_collaborators
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
    system "heroku config:set TZ=America/Sao_Paulo --app #{name}"
  end

  def open
    say "Pushing application to heroku...".magenta
    git push: "heroku master"

    system "heroku open --app #{name}"
  end

  private
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

copy_static_file 'Procfile'
git :add => 'Procfile'
git :commit => "-qm 'Add Procfile'"

if @config[:heroku][:create?]

  say "Refreshing Heroku user credentials".magenta
  unless system "heroku auth:login"
    puts "Could not login to Heroku, halting"
    exit
  end

  production_app = HerokuApp.new(@app_name.gsub('_',''), "app")

  production_app.open if @config[:heroku][:deploy?]
end
