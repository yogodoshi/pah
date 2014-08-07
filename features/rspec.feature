@no-clobber
Feature: RSpec
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a spec/spec_helper.rb
    Then I have a spec/rails_helper.rb
    Then I have a spec/support/database_cleaner.rb
    Then I have a spec/support/factory_girl.rb
    Then I have a spec/support/http_basic_auth.rb
    Then I have a spec/support/matchers.rb
    Then I have a spec/support/suppress_log.rb
    Then I have a spec/support/uploaded_file.rb
    Then I have the file spec/support/vcr.rb and contents of this file should include:
      """
      c.filter_sensitive_data("<#{key.upcase}>") { value }
      """
    Then I have the file spec/support/random_timezone.rb and contents of this file should include:
      """
      Time.zone = ActiveSupport::TimeZone.all.sample
      """
