Feature: Puma
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a config/initializers/database_connection.rb
    Then I have a config/puma.rb
    Then I have the file Procfile and contents of this file should include:
      """
      web: bundle exec puma -C config/puma.rb
      """
