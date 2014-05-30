Feature: Env files
  Background:
    Given I have created a app with pah

  Scenario: Create env files
    Then I have the file .ruby-version and contents of this file should be:
      """
      2.1.2

      """
    Then I have the file .ruby-gemset and contents of this file should be:
      """
      myapp

      """
    Then I have the file .env and contents of this file should include:
      """
      PORT: 3000
      """
