module Pah
  module Templates
    class Mandrill < Pah::Template
      def call
        mandrill_config = <<MANDRILL

  # Mandrill config
  config.action_mailer.default_url_options = { host: ENV['CANONICAL_HOST'] }
  config.action_mailer.smtp_settings = {
    address:              'smtp.mandrillapp.com',
    port:                 '587',
    authentication:       :plain,
    user_name:            ENV['MANDRILL_USERNAME'],
    password:             ENV['MANDRILL_APIKEY'],
    domain:               'heroku.com'
  }
MANDRILL

        inject_into_file 'config/environments/production.rb', mandrill_config,  before: /^end/, verbose: false

        git add: 'config/environments/production.rb'
        git_commit 'Add Mandrill config.'
      end
    end
  end
end
