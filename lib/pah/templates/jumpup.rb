module Pah
  module Templates
    class Jumpup < Pah::Template

      def call
        copy_static_file 'lib/tasks/jumpup.rake'
        copy_static_file 'config/initializers/jumpup_heroku.rb'

        gsub_file 'config/initializers/jumpup_heroku.rb', /PROJECT/, (Pah.configuration.heroku[:name] || Pah.configuration.app_name)

        git add: 'lib/tasks/jumpup.rake'
        git add: 'config/initializers/jumpup_heroku.rb'
        git_commit 'Add jumpup tasks and configuration.'
      end
    end
  end
end
