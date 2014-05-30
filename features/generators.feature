@no-clobber
Feature: Generators
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.generators do |g|
      """
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.app_generators do |g|
      """
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.assets.initialize_on_precompile = false
      """

