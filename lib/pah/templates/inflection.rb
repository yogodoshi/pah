module Pah
  module Templates
    class Inflection < Pah::Template
      def call
        api_acronym_config = <<API_ACRONYM

ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym 'API'
end
API_ACRONYM

        inject_into_file 'config/initializers/inflections.rb', api_acronym_config,  after: /^# end/, verbose: false

        git add: 'config/initializers/inflections.rb'
        git_commit 'Add API acronym to inflections.rb.'
      end
    end
  end
end
