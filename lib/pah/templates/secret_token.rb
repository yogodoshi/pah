module Pah
  module Templates
    class SecretToken < Pah::Template

      def call
        append_to_file '.env', "SECRET_KEY_BASE: #{SecureRandom::hex(60)}\n"

        gsub_file 'config/secrets.yml', /secret_key_base: (.*)/, "secret_key_base: <%= ENV[\"SECRET_KEY_BASE\"] %>"

        git add: 'config/secrets.yml'
        git add: '.env'
        git_commit 'Replace secret key base with environment variable.'
      end
    end
  end
end
