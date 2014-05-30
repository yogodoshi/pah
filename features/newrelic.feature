Feature: Newrelic
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file Gemfile and contents of this file should include:
      """
      gem 'newrelic_rpm'
      """
    Then I have the file config/newrelic.yml and contents of this file should include:
      """
      app_name: myapp
      """
