@no-clobber
Feature: Binstubs
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a bin/bundle
    Then I have a bin/rails
    Then I have a bin/rake
    Then I have a bin/rspec
    Then I have a bin/spring

