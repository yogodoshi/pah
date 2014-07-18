module Pah
  module Templates
    class Cleanup < Pah::Base

      def call
        git rm: "README.rdoc"
        git rm: "app/views/layouts/application.html.erb"

        git_commit 'Remove unnecessary files left over from initial app generation.'
      end
    end
  end
end
