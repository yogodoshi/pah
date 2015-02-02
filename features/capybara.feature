@no-clobber
Feature: Capybara
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a spec/support/capybara.rb
