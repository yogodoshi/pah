@no-clobber
Feature: Env files
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Create the setup script
    Then I have the file bin/setup and contents of this file should include:
      """
      Installing dependencies
      """
