@no-clobber
Feature: Canonical Host
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have the file config.ru and contents of this file should include:
      """
      use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']
      """
