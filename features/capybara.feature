@no-clobber
Feature: Capybara
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a spec/support/acceptance_helpers.rb
    Then I have a spec/support/acceptance_macros.rb
    Then I have a spec/support/capybara.rb
    Then I have a spec/acceptance/dummy_spec.rb
