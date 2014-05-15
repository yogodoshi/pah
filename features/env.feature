Feature: Env files
  Background:
    Given I have created a app with pah

  Scenario: Create env files
    Then I have .ruby-version
    Then I have .ruby-gemset
    Then I have .env


