module Pah
  module Templates
    class Bin < Pah::Template
      def call
        system 'bundle exec spring binstub --all'

        git add: 'bin/rake bin/rails bin/spring'
        git_commit 'Add spring bin files'

        copy_static_file 'bin/setup'

        git add: 'bin/setup'
        git_commit 'Adding setup script.'
      end
    end
  end
end
