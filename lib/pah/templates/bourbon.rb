module Pah
  module Templates
    class Bourbon < Pah::Template
      def call
        css_path = 'app/assets/stylesheets/'
        application_css_path = "#{css_path}application.css"

        prepend_to_file application_css_path do
        <<IMPORTS
@import 'normalize-rails';
@import 'bourbon';
@import 'base/base';
@import 'neat';
IMPORTS
      end

        gsub_file application_css_path, /\*= require_tree \./, '*'

        inside(css_path) do
          system 'bundle exec bitters install'
        end

        gsub_file "#{css_path}base/_base.scss", %r{// @import "grid-settings";}, '@import "grid-settings";'

        system "mv #{application_css_path} #{css_path}application.css.scss"

        git rm: application_css_path
        git add: css_path
        git_commit 'Install bourbon.'
      end
    end
  end
end
