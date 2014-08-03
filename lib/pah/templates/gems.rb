module Pah
  module Templates
    class Gem < Pah::Template
      def call
        copy_static_file 'Gemfile'

        gsub_file 'Gemfile', /RAILS_VERSION/, ::Pah::RAILS_VERSION

        begin
          require 'bundler'
        rescue LoadError
          # Install bundler if needed
          unless run 'gem install bundler --no-ri --no-rdoc'
            puts 'Error installing bundler, will attempt to continue'
          end
          require 'bundler'
        end

        # Install all other gems needed from Gemfile
        unless run 'bundle install --jobs=4'
          puts 'Error installing gems, aborting'
          exit 1
        end

        git add: 'Gemfile*'
        git_commit 'Add Gemfile and Gemfile.lock.'
      end
    end
  end
end
