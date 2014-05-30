@no-clobber
Feature: Rollbar
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have the file Gemfile and contents of this file should include:
      """
      gem 'rollbar'
      """
    Then I have the file config/initializers/rollbar.rb and contents of this file should include:
      """
      config.enabled = Rails.env.production? # || Rails.env.staging?
      """
