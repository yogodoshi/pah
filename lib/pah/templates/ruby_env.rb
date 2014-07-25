module Pah
  module Templates
    class RubyEnv < Pah::Base

      def call
        current_ruby = '2.1.2'
        current_gemset = Pah.configuration.app_name

        copy_static_file '.ruby-version'
        gsub_file '.ruby-version', /RUBY_VERSION/, current_ruby

        copy_static_file '.ruby-gemset'
        gsub_file '.ruby-gemset', /GEMSET/, current_gemset

        git add: '.ruby-version'
        git add: '.ruby-gemset'
        git_commit 'Add .ruby-version and .ruby-gemset'

        copy_static_file '.env'
        git add: '.env'
        git_commit 'Add .env file'
      end
    end
  end
end
