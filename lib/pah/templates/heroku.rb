class HerokuApp < Rails::Generators::AppGenerator
  DEFAULT_ADDONS = %w(heroku-postgresql:dev pgbackups:auto-month logentries
                      mandrill:starter rollbar newrelic:stark librato)

  attr_reader :name, :description, :config

  def initialize(config)
    @config = config
    @name = Pah.configuration.heroku[:name]
    @description = description

    add_secret_token
    add_timezone_config
    add_addons
    add_librato_source
    add_heroku_git_remote
    check_canonical_domain
    check_collaborators
  end

  def add_addons
    DEFAULT_ADDONS.each { |addon| add_heroku_addon(addon) }
  end

  def add_secret_token
    say "Creating SECRET_KEY_BASE for Heroku '#{name}.herokuapp.com'".magenta
    run "heroku config:set SECRET_KEY_BASE=#{SecureRandom.hex(60)} --app #{name}"
  end

  def add_heroku_git_remote
    say "Adding Heroku git remote for deploy to '#{name}'.".magenta
    run "git remote add heroku git@heroku.com:#{name}.git"
  end

  def add_heroku_addon(addon)
    say "Adding heroku addon [#{addon}] to '#{name}'.".magenta
    run "heroku addons:add #{addon} --app #{name}"
  end

  def add_canonical_domain(domain)
    run "heroku domains:add #{domain} --app #{name}"
  end

  def add_collaborator(email)
    run "heroku sharing:add #{email} --app #{name}"
  end

  def add_timezone_config
    say 'Adding timezone config on Heroku'.magenta
    run "heroku config:set TZ=America/Sao_Paulo --app #{name}"
  end

  def add_librato_source
    say 'Configuring LIBRATO_SOURCE environment variable on Heroku'.magenta
    run "heroku config:set LIBRATO_SOURCE=#{name} --app #{name}"
  end

  def open
    say 'Pushing application to heroku...'.magenta

    run 'git push heroku master'

    run "heroku open --app #{name}"
  end

  private

  def run(command)
    unless system(command)
      fail "Error while running #{command}"
    end
  end

  def check_canonical_domain
    domain = Pah.configuration.heroku[:domain]
    add_canonical_domain(domain) unless domain.blank?
  end

  def check_collaborators
    collaborators = Pah.configuration.heroku[:collaborators]

    if collaborators.present?
      collaborators.split(',').map(&:strip).each { |email| add_collaborator(email) }
    end
  end
end

module Pah
  module Templates
    class Heroku < Pah::Template
      def call
        copy_static_file 'Procfile'
        git add: 'Procfile'
        git_commit 'Add Procfile'

        if Pah.configuration.heroku[:create?]
          production_app = HerokuApp.new(Pah.configuration)
          production_app.open if Pah.configuration.heroku[:deploy?]
        end
      end
    end
  end
end
