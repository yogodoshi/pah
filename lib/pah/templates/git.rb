module Pah
  module Templates
    class Git < Pah::Base

      def call
        copy_static_file '.gitignore'

        git :init
        git add: '--all'
        git_commit 'Initial commit.'
      end
    end
  end
end
