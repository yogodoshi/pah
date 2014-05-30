Feature: Gemfile
  Background:
    Given I have created a app with pah

  Scenario: Correct gems on gemfile
    Then I have the file Gemfile and contents of this file should include:
      """
      gem 'rails',                  '4.1.1'
      """

