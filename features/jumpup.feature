@no-clobber
Feature: Jumpup
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a lib/tasks/jumpup.rake
    Then I have a config/initializers/jumpup_heroku.rb
    Then I have the file config/initializers/jumpup_heroku.rb and contents of this file should include:
      """
      config.app = 'myapp'
      """


