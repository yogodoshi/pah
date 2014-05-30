@no-clobber
Feature: Remove unused files
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Remove files
    Then I dont have a README.rdoc
    Then I dont have a app/views/layouts/application.html.erb
