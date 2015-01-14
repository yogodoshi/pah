module Pah
  module Templates
    class Gem < Pah::Template
      def call
        copy_static_file 'Gemfile'

        gsub_file 'Gemfile', /RUBY_VERSION/, ::Pah::RUBY_VERSION
        gsub_file 'Gemfile', /RAILS_VERSION/, ::Pah::RAILS_VERSION


        begin
          require 'bundler'
        rescue LoadError
          # Install bundler if needed
          unless run_with_rvm_env_if_possible 'gem install bundler --no-ri --no-rdoc'
            puts 'Error installing bundler, will attempt to continue'
          end
          require 'bundler'
        end

        # Install all other gems needed from Gemfile
        unless run_with_rvm_env_if_possible 'bundle install --jobs=4'
          puts 'Error installing gems, aborting'
          exit 1
        end

        git add: 'Gemfile*'
        git_commit 'Add Gemfile and Gemfile.lock.'
      end

      def run_with_rvm_env_if_possible(command)
        if rvm_installed?
          current_ruby = ::Pah::RUBY_VERSION
          current_gemset = ::Pah.configuration.app_name
          use_current_ruby_script = %{[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm use ruby-#{current_ruby}@#{current_gemset} --create}
          run "/bin/bash --login -c '#{use_current_ruby_script} && #{command}'"
        else
          run command
        end
      end

      def rvm_installed?
        @_rvm_installed = `which rvm`.present? if @_rvm_installed.nil?
        @_rvm_installed
      end
    end
  end
end
