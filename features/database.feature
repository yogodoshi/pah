Feature: Database
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have correct database.yml
    Then I have schema.rb


