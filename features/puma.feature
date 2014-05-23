Feature: Puma
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a config/initializers/database_connection.rb

