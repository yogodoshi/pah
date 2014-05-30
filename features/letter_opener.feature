@no-clobber
Feature: Letter Opener
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have the file config/environments/development.rb and contents of this file should include:
      """
      config.action_mailer.delivery_method = :letter_opener
      """

