Feature: RSpec
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a spec/spec_helper.rb
    Then I have a spec/support/database_cleaner.rb
    Then I have a spec/support/factory_girl.rb
    Then I have a spec/support/http_basic_auth.rb
    Then I have a spec/support/matchers.rb
    Then I have a spec/support/suppress_log.rb
    Then I have a spec/support/uploaded_file.rb
    Then I have a spec/support/vcr.rb
