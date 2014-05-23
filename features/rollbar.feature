Feature: Rollbar
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file Gemfile and contents of this file should include:
      """
      gem 'rollbar'
      """
    Then I have a config/initializers/rollbar.rb
