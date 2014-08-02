module Pah
  module Templates
    class Capybara < Pah::Template
      def call
        copy_static_file 'spec/support/acceptance_helpers.rb'
        copy_static_file 'spec/support/acceptance_macros.rb'
        copy_static_file 'spec/support/capybara.rb'
        copy_static_file 'spec/support/shared_connection.rb'
        copy_static_file 'spec/acceptance/dummy_spec.rb'

        git add: 'spec/'
        git_commit 'Add capybara helpers.'
      end
    end
  end
end
