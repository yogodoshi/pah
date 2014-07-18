module Pah
  module Templates
    class Sendgrid < Pah::Base

      def call
        sendgrid_config = <<SENDGRID

  # SendGrid config
  config.action_mailer.default_url_options = { host: ENV['CANONICAL_HOST'] }
  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 '587',
    authentication:       :plain,
    user_name:            ENV['SENDGRID_USERNAME'],
    password:             ENV['SENDGRID_PASSWORD'],
    domain:               'heroku.com',
    enable_starttls_auto: true
  }
SENDGRID

        inject_into_file 'config/environments/production.rb', sendgrid_config, { before: /^end/, verbose: false }

        git add: 'config/environments/production.rb'
        git_commit 'Add sendgrid config.'
      end
    end
  end
end
