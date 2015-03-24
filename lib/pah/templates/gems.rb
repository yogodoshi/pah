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
          unless run 'gem install bundler --no-ri --no-rdoc'
            puts 'Error installing bundler, will attempt to continue'.red
          end
          require 'bundler'
        end

        # Install all other gems needed from Gemfile
        status, output = bundle_install_with_progress
        if status != 0
          puts output
          puts 'Error installing gems, aborting'.red
          exit 1
        end

        git add: 'Gemfile*'
        git_commit 'Add Gemfile and Gemfile.lock.'
      end

      def bundle_install_with_progress
        require 'open3'
        output = ""
        status = 0
        Open3.popen3(ENV, "bundle install --jobs=4") do |stdin, stdout, stderr, wait_thr|
          while line = stdout.gets
            output += line
            print ".".green
          end
          status = wait_thr.value.to_i
        end
        puts ""
        [status, output]
      end

    end
  end
end
