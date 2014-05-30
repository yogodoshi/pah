@no-clobber
Feature: Heroku
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a Procfile
