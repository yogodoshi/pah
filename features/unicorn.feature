@no-clobber
Feature: Puma
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a config/unicorn.rb
    Then I have the file Procfile and contents of this file should include:
      """
      web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
      """
