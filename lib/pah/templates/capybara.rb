module Pah
  module Templates
    class Capybara < Pah::Template
      def call
        copy_static_file 'spec/support/capybara.rb'

        git add: 'spec/'
        git_commit 'Add capybara helpers.'
      end
    end
  end
end
