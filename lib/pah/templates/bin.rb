module Pah
  module Templates
    class Bin < Pah::Template
      def call
        system 'bundle exec spring binstub --all'

        git add: 'bin/rake bin/rails bin/spring'
        git_commit 'Add spring bin files'
      end
    end
  end
end
