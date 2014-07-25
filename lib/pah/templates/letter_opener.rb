module Pah
  module Templates
    class LetterOpener < Pah::Template

      def call
        letter_opener_config = <<LETTER_OPENER

  # Letter openner config
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
LETTER_OPENER

        inject_into_file 'config/environments/development.rb', letter_opener_config, { before: /^end/, verbose: false }

        git add: 'config/environments/development.rb'
        git_commit 'Add letter_opener config.'
      end
    end
  end
end
