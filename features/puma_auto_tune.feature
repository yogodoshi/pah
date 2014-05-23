Feature: Puma auto tune
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a config/initializers/puma_auto_tune.rb
