module Pah
  module Templates
    class Rspec < Pah::Base

      def call
        copy_static_file 'spec/spec_helper.rb'
        copy_static_file 'spec/rails_helper.rb'

        %w{
          database_cleaner.rb
          factory_girl.rb
          http_basic_auth.rb
          matchers.rb
          suppress_log.rb
          uploaded_file.rb
          vcr.rb
        }.each do |component|
          copy_static_file "spec/support/#{component}"
        end

        git add: 'spec'
        git_commit 'Add RSpec support files'
      end
    end
  end
end
