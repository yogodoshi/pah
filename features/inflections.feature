@no-clobber
Feature: Inflections
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Add API as acronym
    Then I have the file config/initializers/inflections.rb and contents of this file should include:
      """
      # end

      # These inflection rules are supported but not enabled by default:
      """
    Then I have the file config/initializers/inflections.rb and contents of this file should end with:
      """
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'API'
      end

      """
