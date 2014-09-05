@no-clobber
Feature: Inflections
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Add API as acronym
    Then I have the file config/initializers/inflections.rb and contents of this file should include:
      """
      ActiveSupport::Inflector.inflections do |inflect|
      """
    Then I have the file config/initializers/inflections.rb and contents of this file should include:
      """
      inflect.acronym 'API'
      """
