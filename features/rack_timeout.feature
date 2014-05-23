Feature: Rack Timeout
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a config/initializers/rack_timeout.rb

