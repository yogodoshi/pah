module Pah
  module Templates
    class Git < Pah::Template
      def call
        copy_static_file '.gitignore'

        git init: '-q'
        git add: '--all'
        git_commit 'Initial commit.'
      end
    end
  end
end
