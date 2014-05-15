Feature: Remove unused files
  Background:
    Given I have created a app with pah

  Scenario: Remove files
    Then I dont have a README.rdoc
    Then I dont have application.html.erb
