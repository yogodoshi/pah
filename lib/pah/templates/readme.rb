module Pah
  module Templates
    class Readme < Pah::Base

      def call
        copy_static_file 'README.md'
        gsub_file 'README.md', /PROJECT/, Pah.configuration.app_name
        gsub_file 'README.md', /RUBY_VERSION/, RUBY_VERSION

        git add: 'README.md'
        git_commit 'Add README file.'
      end
    end
  end
end
