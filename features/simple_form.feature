@no-clobber
Feature: Simple Form
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a config/locales/simple_form.pt-BR.yml
